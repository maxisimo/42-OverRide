# 1st Step
  
List the files will show us `level00` executable
```
level00@OverRide:~$ ls -l
total 8
-rwsr-s---+ 1 level01 users 7280 Sep 10  2016 level00
level00@OverRide:~$ ./level00
***********************************
*           -Level00 -            *
***********************************
Password:bla

Invalid Password!
level00@OverRide:~$
```
The program waits for a password and print "Invalid Password!" if it's not good.  
After analyze it with gdb we can find just a `main()`.  
Please refer to file [asm_analysis.md](https://github.com/maxisimo/42-OverRide/blob/main/level00/Ressources/asm_analysis.md) in parallel of [source.c](https://github.com/maxisimo/42-OverRide/blob/main/level00/source.c) for more details.  
The function `scanf` is called. Then, the binary compares the input with 5276.  
By passing 5276 as the expected input, the program calls `system` to start a new /bin/sh process.
```
level00@OverRide:~$ ./level00
***********************************
*           -Level00 -            *
***********************************
Password:5276

Authenticated!
$ whoami
level01
$ cat /homee/users/level01/.pass
cat: /homee/users/level01/.pass: No such file or directory
$ cat /home/users/level01/.pass
uSq2ehEGT6c9S24zbshexZQBXUGrncxn5sD5QfGL
$ exit
level00@OverRide:~$ su level01
Password:
RELRO           STACK CANARY      NX            PIE             RPATH      RUNPATH      FILE
Partial RELRO   No canary found   NX disabled   No PIE          No RPATH   No RUNPATH   /home/users/level01/level01
level01@OverRide:~$
```
Level00 passed !
