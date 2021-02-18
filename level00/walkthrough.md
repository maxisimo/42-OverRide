# 1st Step
  
List the files will show us 'level00' executable
```
level00@OverRide:~$ ls -l
total 8
-rwsr-s---+ 1 level01 users 7280 Sep  10  2016 level00
level00@OverRide:~$ ./level00
***********************************
*            -Level00 -           *
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
*            -Level00 -           *
***********************************
Password:5276

Authentificated!
$ whoami
level01
$ cat /home/users/level01/.pass
uSq2ehEGT6c9S24zbshexZQBXUGrncxn5sD5QfGL
$ exit
level00@OverRide:~$ su level01
Password:
level01@OverRide:~$
```
Level00 passed !
