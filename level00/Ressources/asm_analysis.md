* [Get functions infos](#Get-functions-infos)
* [main](#main)
	- [Explanations](#Explanations)

# Get functions infos
```
(gdb) info functions
All defined functions:

Non-debugging symbols:
0x08048338  _init
0x08048380  printf
0x08048380  printf@plt
0x08048390  puts
0x08048390  puts@plt
0x080483a0  system
0x080483a0  system@plt
0x080483b0  __gmon_start__
0x080483b0  __gmon_start__@plt
0x080483c0  __libc_start_main
0x080483c0  __libc_start_main@plt
0x080483d0  __isoc99_scanf
0x080483d0  __isoc99_scanf@plt
0x080483e0  _start
0x08048410  __do_global_dtors_aux
0x08048470  frame_dummy
0x08048494  main
0x08048520  __libc_csu_init
0x08048590  __libc_csu_fini
0x08048592  __i686.get_pc_thunk.bx
0x080485a0  __do_global_ctors_aux
0x080485cc  _fini
```

# main
```
Dump of assembler code for function main:
   0x08048494 <+0>:	push   ebp
   0x08048495 <+1>:	mov    ebp,esp
   0x08048497 <+3>:	and    esp,0xfffffff0
   0x0804849a <+6>:	sub    esp,0x20
   0x0804849d <+9>:	mov    DWORD PTR [esp],0x80485f0
   0x080484a4 <+16>:	call   0x8048390 <puts@plt>
   0x080484a9 <+21>:	mov    DWORD PTR [esp],0x8048614
   0x080484b0 <+28>:	call   0x8048390 <puts@plt>
   0x080484b5 <+33>:	mov    DWORD PTR [esp],0x80485f0
   0x080484bc <+40>:	call   0x8048390 <puts@plt>
   0x080484c1 <+45>:	mov    eax,0x804862c
   0x080484c6 <+50>:	mov    DWORD PTR [esp],eax
   0x080484c9 <+53>:	call   0x8048380 <printf@plt>
   0x080484ce <+58>:	mov    eax,0x8048636
   0x080484d3 <+63>:	lea    edx,[esp+0x1c]
   0x080484d7 <+67>:	mov    DWORD PTR [esp+0x4],edx
   0x080484db <+71>:	mov    DWORD PTR [esp],eax
   0x080484de <+74>:	call   0x80483d0 <__isoc99_scanf@plt>
   0x080484e3 <+79>:	mov    eax,DWORD PTR [esp+0x1c]
   0x080484e7 <+83>:	cmp    eax,0x149c
   0x080484ec <+88>:	jne    0x804850d <main+121>
   0x080484ee <+90>:	mov    DWORD PTR [esp],0x8048639
   0x080484f5 <+97>:	call   0x8048390 <puts@plt>
   0x080484fa <+102>:	mov    DWORD PTR [esp],0x8048649
   0x08048501 <+109>:	call   0x80483a0 <system@plt>
   0x08048506 <+114>:	mov    eax,0x0
   0x0804850b <+119>:	jmp    0x804851e <main+138>
   0x0804850d <+121>:	mov    DWORD PTR [esp],0x8048651
   0x08048514 <+128>:	call   0x8048390 <puts@plt>
   0x08048519 <+133>:	mov    eax,0x1
   0x0804851e <+138>:	leave
   0x0804851f <+139>:	ret
End of assembler dump.
```

## Explanations
```
   0x08048494 <+0>:	push   ebp
   0x08048495 <+1>:	mov    ebp,esp
```
<+0> : Push `ebp` to save the beginning of the previous function's stackframe.  
<+1> : Stores the contents of ESP (Stack Pointer), where the address of the top of the stack is contained, in EBP.
```
   0x08048497 <+3>:	and    esp,0xfffffff0
   0x0804849a <+6>:	sub    esp,0x20
```
<+3> : [Stack align](https://github.com/maxisimo/42-RainFall/blob/main/doc/asm_x86/alignment.md) on 16 bytes unnecessary, because there are no SIMD instructions.  
<+6> : 32 bytes are allocated to the main function for its local variables.
```
   0x0804849d <+9>:	mov    DWORD PTR [esp],0x80485f0
   0x080484a4 <+16>:	call   0x8048390 <puts@plt>
```
<+9> : Set argument for `puts()` function.  
<+16> : Call to `puts()` function with value at address `esp` as argument
*``'*' <repeats 35 times>``*.
```
   0x080484a9 <+21>:	mov    DWORD PTR [esp],0x8048614
   0x080484b0 <+28>:	call   0x8048390 <puts@plt>
```
<+21> : Set argument for `puts()` function.  
<+28> : Call to `puts()` function with value at address `esp` as argument.  
*`"* \t     -Level00 -\t\t  *"`*.
```
   0x080484b5 <+33>:	mov    DWORD PTR [esp],0x80485f0
   0x080484bc <+40>:	call   0x8048390 <puts@plt>
```
<+33> : Set argument for `puts()` function.  
<+40> : Call to `puts()` function with value at address `esp` as argument.  
*``'*' <repeats 35 times>``*.
```
   0x080484c1 <+45>:	mov    eax,0x804862c
   0x080484c6 <+50>:	mov    DWORD PTR [esp],eax
   0x080484c9 <+53>:	call   0x8048380 <printf@plt>
```
<+45> - <+50> : Set argument for `printf()` function.  
<+53> : Call to `printf()` function with value at address `esp` as argument.  
*`printf("Password:")`*.
```
   0x080484ce <+58>:	mov    eax,0x8048636
   0x080484d3 <+63>:	lea    edx,[esp+0x1c]
   0x080484d7 <+67>:	mov    DWORD PTR [esp+0x4],edx
   0x080484db <+71>:	mov    DWORD PTR [esp],eax
   0x080484de <+74>:	call   0x80483d0 <__isoc99_scanf@plt>
```
<+58> : Store the value at `0x8048636` in `eax` (eax = "%d").  
<+63> : Load the effective address `esp+0x1c` in `edx`, so `edx` is now pointing on `esp+0x1c` (perfect, scanf() function need a pointer as second argument).  
<+67> - <+71> : Set arguments for `scanf()` function.  
<+74> : Call to `scanf()` function with values at addresses `esp` and `esp+4` as arguments.  
*`scanf("%d", &pwd)`*  
At this moment the stack should like :
```
                   High addresses

                |     OLD_EBP     |
      EBP =>    +-----------------+    ----+
                :       pwd       :        |
  ESP+0x1c =>   +-----------------+        |
                :                 :        |
                :                 :        |
                :       uni*      :        |
                :                 :        |  32 bytes allocated
                :                 :        |
  ESP+0x8 =>    +-----------------+        |
                :       &pwd      :        |
  ESP+0x4 =>    +-----------------+        |
                :       "%d"      :        |
      ESP =>    +-----------------+    ----+
                   Low addresses

*uni : uninitialized
```
Let's get back to our code :
```
   0x080484e3 <+79>:	mov    eax,DWORD PTR [esp+0x1c]
   0x080484e7 <+83>:	cmp    eax,0x149c
   0x080484ec <+88>:	jne    0x804850d <main+121>
```
<+79> : Store the value at `esp+0x1c` (what scanf() has stored in our buffer `pwd`) in `eax`.  
<+83> : Compare the value stored in `eax` (the password) with `0x149c` (5276).  
<+88> : JNE comparaison. If the value in `eax` is not equal to `0x149c`, jump to the address `0x0804850d` (main+121), otherwise continue.
```
   0x080484ee <+90>:	mov    DWORD PTR [esp],0x8048639
   0x080484f5 <+97>:	call   0x8048390 <puts@plt>
```
<+33> : Set argument for `puts()` function.  
<+40> : Call to `puts()` function with value at address `esp` as argument.  
*`"\nAuthenticated!"`*.
```
   0x080484fa <+102>:	mov    DWORD PTR [esp],0x8048649
   0x08048501 <+109>:	call   0x80483a0 <system@plt>
```
<+102> : Set argument for `system()` function.  
<+109> : Call to `system()` function with value at address `esp` as argument.  
*`system("/bin/sh")`*
```
   0x08048506 <+114>:	mov    eax,0x0
   0x0804850b <+119>:	jmp    0x804851e <main+138>
```
<+114> - <+119> : Set the register `eax` as 0 before jump to the `leave` `ret` instructions. In others terms we quit the `main()` function by doing an equivalent of `return(0)` in C.
```
   0x0804850d <+121>:	mov    DWORD PTR [esp],0x8048651
   0x08048514 <+128>:	call   0x8048390 <puts@plt>
   0x08048519 <+133>:	mov    eax,0x1
```
*Remember, this is where we would have jumped with the JNE instruction if `eax` hadn't been equal to `0x149c`.*
<+33> : Set argument for `puts()` function.  
<+40> : Call to `puts()` function with value at address `esp` as argument.  
*`"\nInvalid Password!"`*.  
<+133> : Set the register `eax` as 1 before `leave` and `ret` instructions. In others terms we quit the `main()` function by doing an equivalent of `return(1)` in C.
```
   0x0804851e <+138>:	leave
   0x0804851f <+139>:	ret
```
<+138> - <+139> : These two lines allow us to find the state of the registers before executing the function. In others terms we quit the `main()` function.  
Before `leave` and `ret` instructions, if we entered the correct password, the stack should look like :
```
                   High addresses

                |     OLD_EBP     |
      EBP =>    +-----------------+    ----+
                :       pwd       :        |
  ESP+0x1c =>   +-----------------+        |
                :                 :        |
                :                 :        |
                :       uni*      :        |
                :                 :        |  32 bytes allocated
                :                 :        |
  ESP+0x8 =>    +-----------------+        |
                :       &pwd      :        |
  ESP+0x4 =>    +-----------------+        |
                :    "/bin/sh"    :        |
      ESP =>    +-----------------+    ----+
                   Low addresses

*uni : uninitialized
```