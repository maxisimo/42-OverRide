* [Get functions infos](#Get-functions-infos)
* [main](#main)
	- [Explanations](#Main-explanations)
* [Verify user name](#verify_user_name)
    - [Explanations](#verify_name-explanations)
* [Verify user pass](#verify_user_pass)
    - [Explanations](#verify_pass-explanations)

# Get functions infos
```
(gdb) info functions
All defined functions:

Non-debugging symbols:
0x08048318  _init
0x08048360  printf
0x08048360  printf@plt
0x08048370  fgets
0x08048370  fgets@plt
0x08048380  puts
0x08048380  puts@plt
0x08048390  __gmon_start__
0x08048390  __gmon_start__@plt
0x080483a0  __libc_start_main
0x080483a0  __libc_start_main@plt
0x080483b0  _start
0x080483e0  __do_global_dtors_aux
0x08048440  frame_dummy
0x08048464  verify_user_name
0x080484a3  verify_user_pass
0x080484d0  main
0x080485c0  __libc_csu_init
0x08048630  __libc_csu_fini
0x08048632  __i686.get_pc_thunk.bx
0x08048640  __do_global_ctors_aux
0x0804866c  _fini
```

# main
```
Dump of assmbler code for function main:
   0x080484d0 <+0>:	push   ebp
   0x080484d1 <+1>:	mov    ebp,esp
   0x080484d3 <+3>:	push   edi
   0x080484d4 <+4>:	push   ebx
   0x080484d5 <+5>:	and    esp,0xfffffff0
   0x080484d8 <+8>:	sub    esp,0x60
   0x080484db <+11>:	lea    ebx,[esp+0x1c]
   0x080484df <+15>:	mov    eax,0x0
   0x080484e4 <+20>:	mov    edx,0x10
   0x080484e9 <+25>:	mov    edi,ebx
   0x080484eb <+27>:	mov    ecx,edx
   0x080484ed <+29>:	rep stos DWORD PTR es:[edi],eax
   0x080484ef <+31>:	mov    DWORD PTR [esp+0x5c],0x0
   0x080484f7 <+39>:	mov    DWORD PTR [esp],0x80486b8
   0x080484fe <+46>:	call   0x8048380 <puts@plt>
   0x08048503 <+51>:	mov    eax,0x80486df
   0x08048508 <+56>:	mov    DWORD PTR [esp],eax
   0x0804850b <+59>:	call   0x8048360 <printf@plt>
   0x08048510 <+64>:	mov    eax,ds:0x804a020
   0x08048515 <+69>:	mov    DWORD PTR [esp+0x8],eax
   0x08048519 <+73>:	mov    DWORD PTR [esp+0x4],0x100
   0x08048521 <+81>:	mov    DWORD PTR [esp],0x804a040
   0x08048528 <+88>:	call   0x8048370 <fgets@plt>
   0x0804852d <+93>:	call   0x8048464 <verify_user_name>
   0x08048532 <+98>:	mov    DWORD PTR [esp+0x5c],eax
   0x08048536 <+102>:	cmp    DWORD PTR [esp+0x5c],0x0
   0x0804853b <+107>:	je     0x8048550 <main+128>
   0x0804853d <+109>:	mov    DWORD PTR [esp],0x80486f0
   0x08048544 <+116>:	call   0x8048380 <puts@plt>
   0x08048549 <+121>:	mov    eax,0x1
   0x0804854e <+126>:	jmp    0x80485af <main+223>
   0x08048550 <+128>:	mov    DWORD PTR [esp],0x804870d
   0x08048557 <+135>:	call   0x8048380 <puts@plt>
   0x0804855c <+140>:	mov    eax,ds:0x804a020
   0x08048561 <+145>:	mov    DWORD PTR [esp+0x8],eax
   0x08048565 <+149>:	mov    DWORD PTR [esp+0x4],0x64
   0x0804856d <+157>:	lea    eax,[esp+0x1c]
   0x08048571 <+161>:	mov    DWORD PTR [esp],eax
   0x08048574 <+164>:	call   0x8048370 <fgets@plt>
   0x08048579 <+169>:	lea    eax,[esp+0x1c]
   0x0804857d <+173>:	mov    DWORD PTR [esp],eax
   0x08048580 <+176>:	call   0x80484a3 <verify_user_pass>
   0x08048585 <+181>:	mov    DWORD PTR [esp+0x5c],eax
   0x08048589 <+185>:	cmp    DWORD PTR [esp+0x5c],0x0
   0x0804858e <+190>:	je     0x8048597 <main+199>
   0x08048590 <+192>:	cmp    DWORD PTR [esp+0x5c],0x0
   0x08048595 <+197>:	je     0x80485aa <main+218>
   0x08048597 <+199>:	mov    DWORD PTR [esp],0x804871e
   0x0804859e <+206>:	call   0x8048380 <puts@plt>
   0x080485a3 <+211>:	mov    eax,0x1
   0x080485a8 <+216>:	jmp    0x80485af <main+223>
   0x080485aa <+218>:	mov    eax,0x0
   0x080485af <+223>:	lea    esp,[ebp-0x8]
   0x080485b2 <+226>:	pop    ebx
   0x080485b3 <+227>:	pop    edi
   0x080485b4 <+228>:	pop    ebp
   0x080485b5 <+229>:	ret
End of assembler dump.
```

## Main explanations
```
Dump of assmbler code for function main:
   0x080484d0 <+0>:	push   ebp
   0x080484d1 <+1>:	mov    ebp,esp
   0x080484d3 <+3>:	push   edi
   0x080484d4 <+4>:	push   ebx
```
<+0> : Push `ebp` to save the beginning of the previous function's stackframe.  
<+1> : Stores the contents of ESP (Stack Pointer), where the address of the top of the stack is contained, in EBP.  
<+3> - <+4> : Save the old values of `edi` and `ebx`.
```
   0x080484d5 <+5>:	and    esp,0xfffffff0
   0x080484d8 <+8>:	sub    esp,0x60
```
<+5> : [Stack align](https://github.com/maxisimo/42-RainFall/blob/main/doc/asm_x86/alignment.md) on 16 bytes unnecessary, because there are no SIMD instructions.  
<+8> : 96 bytes are allocated to the main function for its local variables.
```
   0x080484db <+11>:	lea    ebx,[esp+0x1c]
   0x080484df <+15>:	mov    eax,0x0
   0x080484e4 <+20>:	mov    edx,0x10
   0x080484e9 <+25>:	mov    edi,ebx
   0x080484eb <+27>:	mov    ecx,edx
   0x080484ed <+29>:	rep stos DWORD PTR es:[edi],eax
   0x080484ef <+31>:	mov    DWORD PTR [esp+0x5c],0x0
```
*The [stos](https://www.tutorialspoint.com/assembly_programming/assembly_stos_instruction.htm) instruction copies the data item from `eax` (for doublewords - STOSD) to the destination string, pointed to by `es:[edi]` in memory.*  
*The `rep` prefix, when set before a string instruction (here `stos`), causes repetition of the instruction based on a counter placed at the `ecx` register. `rep` executes the instruction, decreases `ecx` by 1, and checks whether `ecx` is zero. It repeats the instruction processing until `ecx` is zero.*  
  
<+11> - <+29> : The `rep stos DWORD PTR es:[edi],eax` instruction copies the data from `eax` (0) into `[esp+0x1c]` pointed to by `es:[edi]`. It is similar to `memset()` function or `char str[size] = { }` instruction in C where "size" is the size of your string/tab.  
*`char  pwd[64] = { }                   // 0x5c - 0x1c = 64`*.   
<+31> : Initialise a variable to 0, due to the rest of the code we'll call it `verify`.
```
   0x080484f7 <+39>:	mov    DWORD PTR [esp],0x80486b8
   0x080484fe <+46>:	call   0x8048380 <puts@plt>
```
<+39> : Set argument for `puts()` function.  
<+46> : Call to `puts()` function with value at address `esp` as argument.  
*`"********* ADMIN LOGIN PROMPT *********"`*.
```
   0x08048503 <+51>:	mov    eax,0x80486df
   0x08048508 <+56>:	mov    DWORD PTR [esp],eax
   0x0804850b <+59>:	call   0x8048360 <printf@plt>
```
<+51> - <+56> : Set argument for `printf()` function.  
<+53> : Call to `printf()` function with value at address `esp` as argument.  
*`printf("Enter Username: ")`*.
```
   0x08048510 <+64>:	mov    eax,ds:0x804a020
   0x08048515 <+69>:	mov    DWORD PTR [esp+0x8],eax
   0x08048519 <+73>:	mov    DWORD PTR [esp+0x4],0x100
   0x08048521 <+81>:	mov    DWORD PTR [esp],0x804a040
   0x08048528 <+88>:	call   0x8048370 <fgets@plt>
```
<+64> : 'ds:0x804a020' notation means that we reach the *offset* from address in 'DS' (data segment register), so the instruction moves double word (32-bit value) from address 'ds:0x804a020' to register `eax` (eax = stdin).  
<+69> - <+81> : Set arguments for `fgets()` function.  
*nb: I don't know why it don't use `lea` instruction in order to make esp point on an address but with gdb we can see that `0x804a040` represent a variable called a_user_name which do probably the same thing :*  
```
(gdb) x /s 0x804a040
0x804a040 <a_user_name>:         ""
(gdb)
```
<+74> : Call to `fgets()` function with values at addresses of `esp`, `esp+4` and `esp+8` as argument.  
*`fgets(a_user_name, 256, stdin)`*.
```
   0x0804852d <+93>:	call   0x8048464 <verify_user_name>
   0x08048532 <+98>:	mov    DWORD PTR [esp+0x5c],eax
   0x08048536 <+102>:	cmp    DWORD PTR [esp+0x5c],0x0
   0x0804853b <+107>:	je     0x8048550 <main+128>
```
<+93> - <+98> : Call to `verify_user_name()` function and save it return value at address `esp+0x5c` (verify variable).  
<+102> : Compare the value stored in `esp+0x5c` to 0.  
<+107> : JE comparaison. If the value in `esp+0x5c` is equal to 0, jump to the address `0x8048550` (main+128), otherwise continue.
```
   0x0804853d <+109>:	mov    DWORD PTR [esp],0x80486f0
   0x08048544 <+116>:	call   0x8048380 <puts@plt>
   0x08048549 <+121>:	mov    eax,0x1
   0x0804854e <+126>:	jmp    0x80485af <main+223>
```
<+109> - <+126> : So if `verify_user_name()` function didn't return 0 (see the cmp/je upper), the program calls `puts()` and store 1 into `eax` before jump to `0x80485af` (main+223) in order to quit the function by returning 1.  
*`puts("nope, incorrect username...\n")`*.
```
   0x08048550 <+128>:	mov    DWORD PTR [esp],0x804870d
   0x08048557 <+135>:	call   0x8048380 <puts@plt>
```
<+128> : Set argument for `puts()` function.  
<+135> : Call to `puts()` function with value at address `esp` as argument.  
*`"Enter Password: "`*.
```
   0x0804855c <+140>:	mov    eax,ds:0x804a020
   0x08048561 <+145>:	mov    DWORD PTR [esp+0x8],eax
   0x08048565 <+149>:	mov    DWORD PTR [esp+0x4],0x64
   0x0804856d <+157>:	lea    eax,[esp+0x1c]
   0x08048571 <+161>:	mov    DWORD PTR [esp],eax
   0x08048574 <+164>:	call   0x8048370 <fgets@plt>
```
<+140> : 'ds:0x804a020' notation means that we reach the *offset* from address in 'DS' (data segment register), so the instruction moves double word (32-bit value) from address 'ds:0x804a020' to register `eax` (eax = stdin).  
<+157> : Load the effective address `esp+0x1c` (pwd string) in `eax`, so `eax` is now pointing on `esp+0x1c` (perfect, fgets() function need a pointer as argument).  
<+145> - <+161> : Set arguments for `fgets()` function.  
<+74> : Call to `fgets()` function with values at addresses of `esp`, `esp+4` and `esp+8` as argument.  
*`fgets(pwd, 100, stdin)`*
```
   0x08048579 <+169>:	lea    eax,[esp+0x1c]
   0x0804857d <+173>:	mov    DWORD PTR [esp],eax
   0x08048580 <+176>:	call   0x80484a3 <verify_user_pass>
   0x08048585 <+181>:	mov    DWORD PTR [esp+0x5c],eax
```
<+169> - <+181> : Call to `verify_user_pass()` function with value at `esp+0x1c` (pwd string) as argument and save it return value at `esp+0x5c` (verify variable).
```
   0x08048589 <+185>:	cmp    DWORD PTR [esp+0x5c],0x0
   0x0804858e <+190>:	je     0x8048597 <main+199>
   0x08048590 <+192>:	cmp    DWORD PTR [esp+0x5c],0x0
   0x08048595 <+197>:	je     0x80485aa <main+218>
```
<+185> : Compare the value stored in `esp+0x5c` to 0.  
<+190> : JE comparaison. If the value in `esp+0x5c` is equal to 0, jump to the address `0x8048597` (main+199), otherwise continue.  
<+192> - <+197> : Same comparaison with a jump to the address `0x80485aa` (main+218).  
*nb: The second cmp/je are not necessary because if the value stored in `esp+0x5c` is equal to 0, we'll pass over it with the first jump (main+199). And if it's not equal to 0 we'll continue to the next instruction (main+199).*
```
   0x08048597 <+199>:	mov    DWORD PTR [esp],0x804871e
   0x0804859e <+206>:	call   0x8048380 <puts@plt>
```
<+199> : Set argument for `puts()` function.  
<+206> : Call to `puts()` function with value at address `esp` as argument.  
*`"nope, incorrect password...\n"`*
```
   0x080485a3 <+211>:	mov    eax,0x1
   0x080485a8 <+216>:	jmp    0x80485af <main+223>
```
<+211> - <+216> : Store 1 into `eax` before jump to `0x80485af` (main+223) in order to quit the function by returning 1.
```
   0x080485aa <+218>:	mov    eax,0x0
```
<+218> : Store 0 into `eax` before continue to `0x80485af` (main+223) in order to quit the function by returning 0.
```
   0x080485af <+223>:	lea    esp,[ebp-0x8]
   0x080485b2 <+226>:	pop    ebx
   0x080485b3 <+227>:	pop    edi
   0x080485b4 <+228>:	pop    ebp
   0x080485b5 <+229>:	ret
```
<+223> - <+227> : Give back esp value (esp aligned at 16-bytes) then pop ebx and edi in order to retrieve their old values.  
<+228> : Retrieve the old ebp.  
*Instructions `lea esp,[ebp-0x8]` and `pop ebp` combined are very similar to leave instruction.*  
<+229> : Retrieve the next instructions after the call of the main() function !


# verify_user_name
```
Dump of assembler code for function verify_user_name:
   0x08048464 <+0>:	push   ebp
   0x08048465 <+1>:	mov    ebp,esp
   0x08048467 <+3>:	push   edi
   0x08048468 <+4>:	push   esi
   0x08048469 <+5>:	sub    esp,0x10
   0x0804846c <+8>:	mov    DWORD PTR [esp],0x8048690
   0x08048473 <+15>:	call   0x8048380 <puts@plt>
   0x08048478 <+20>:	mov    edx,0x804a040
   0x0804847d <+25>:	mov    eax,0x80486a8
   0x08048482 <+30>:	mov    ecx,0x7
   0x08048487 <+35>:	mov    esi,edx
   0x08048489 <+37>:	mov    edi,eax
   0x0804848b <+39>:	repz cmps BYTE PTR ds:[esi],BYTE PTR es:[edi]
   0x0804848d <+41>:	seta   dl
   0x08048490 <+44>:	setb   al
   0x08048493 <+47>:	mov    ecx,edx
   0x08048495 <+49>:	sub    cl,al
   0x08048497 <+51>:	mov    eax,ecx
   0x08048499 <+53>:	movsx  eax,al
   0x0804849c <+56>:	add    esp,0x10
   0x0804849f <+59>:	pop    esi
   0x080484a0 <+60>:	pop    edi
   0x080484a1 <+61>:	pop    ebp
   0x080484a2 <+62>:	ret
End of assembler dump.
```

## verify_name explanations
```
   0x08048464 <+0>:	push   ebp
   0x08048465 <+1>:	mov    ebp,esp
   0x08048467 <+3>:	push   edi
   0x08048468 <+4>:	push   esi
   0x08048469 <+5>:	sub    esp,0x10
```
<+0> : Push `ebp` to save the beginning of the previous function's stackframe.  
<+1> : Stores the contents of ESP (Stack Pointer), where the address of the top of the stack is contained, in EBP.  
<+3> - <+4> : Save the old values of `edi` and `esi`.  
<+5> : 16 bytes are allocated to the function for its local variables.  
```
   0x0804846c <+8>:	mov    DWORD PTR [esp],0x8048690
   0x08048473 <+15>:	call   0x8048380 <puts@plt>
```
<+8> : Set argument for `puts()` function.  
<+15> : Call to `puts()` function with value at address `esp` as argument.  
*`"verifying username....\n"`*.
```
   0x08048478 <+20>:	mov    edx,0x804a040
   0x0804847d <+25>:	mov    eax,0x80486a8
   0x08048482 <+30>:	mov    ecx,0x7
   0x08048487 <+35>:	mov    esi,edx
   0x08048489 <+37>:	mov    edi,eax
   0x0804848b <+39>:	repz cmps BYTE PTR ds:[esi],BYTE PTR es:[edi]
   0x0804848d <+41>:	seta   dl
   0x08048490 <+44>:	setb   al
   0x08048493 <+47>:	mov    ecx,edx
   0x08048495 <+49>:	sub    cl,al
   0x08048497 <+51>:	mov    eax,ecx
   0x08048499 <+53>:	movsx  eax,al
   0x0804849c <+56>:	add    esp,0x10
```
*The [cmps](https://c9x.me/x86/html/file_module_x86_id_38.html) instruction compares `esi` to `edi` by substracting them (as a `sub dest, src`) and sets the status flags CF (Carry Flag) and ZF (Zero Flag) in the [EFLAGS](http://www.c-jump.com/CIS77/ASM/Instructions/I77_0070_eflags_bits.htm) register according to the results.*  
*The `repz` prefix means to increment `esi` and `edi` then repeat cmps until `ecx` or ZF flag is not equal to 0*  

<+20> - <+39> : The `repz cmps BYTE PTR ds:[esi],BYTE PTR es:[edi]` instruction compare the N first byte of the two strings into ds:[esi] and es:[edi], where N is the value of `ecx`. It is similar to `strncmp()` function in C (strncmp(username, "dat_wil", 7)).  
*nb : The rest of the program depends on the values of CF and ZF, here are the different possible combinations depending on `cmps` instruction :*  
```
cmps BYTE PTR ds:[esi],BYTE PTR es:[edi]         ZF     CF
-----------------------------------------------------------
BYTE PTR ds:[esi] = BYTE PTR es:[edi]            1       0

BYTE PTR ds:[esi] < BYTE PTR es:[edi]            0       1 

BYTE PTR ds:[esi] > BYTE PTR es:[edi]            0       0 
```
*During the rest of the code, we'll suppose that the two strings into ds:[esi] and es:[edi] was equal.*  
<+41> : Set `dl` to 1 if CF=0 and ZF=0, otherwise 0  
*`dl` is a sub register, [click here](https://www.gladir.com/CODER/ASM8086/registre.htm) if you need more informations. You may also need some documentation about [movsx](https://www.gladir.com/LEXIQUE/ASM/movsx.htm) instruction!*
```
1. edx = 0x0804a040 =  0000100000000100   10100000   01000000
                      |________________| |________| |________|
                          dh: 0x0804      dh: 0xa0   dl: 0x40
2. dl = 0b00000000
3. edx = 0x0804a000 =  0000100000000100   10100000   00000000
                      |________________| |________| |________|
                          dh: 0xbfff      dh: 0xf6   dl: 0x00
```
<+44> : Set `al` to 1 if CF=1, othewise 0
```
1. eax = 0x080486a8 =  0000100000000100   10000110   10101000
                      |________________| |________| |________|
                          dh: 0x0804      dh: 0x86   dl: 0xa8
2. al = 0b00000000
3. eax = 0x08048600 =  0000100000000100   10000110   00000000
                      |________________| |________| |________|
                          dh: 0x0804      dh: 0x88   dl: 0x00
```
=> `dl` or `al` will be set to 1 if "strncmp" didn't return 0 (I know it's not a real strncmp but this way is easier to understand).  
<+47> : Save the value at `edx` in `ecx` (`0xbffff600`).  
<+49> : `cl` = `cl` - `al` (this change nothing only if "strncmp" return 0).  
<+51> : Save the value at `ecx` in `eax` (`0xbffff600`).  
<+53> : Copies the contents of the 8-bit register (`al`) to the 32-bit register (`eax`) with a sign extension.
```
                            +-------------+
al:                         |  0 0000000  |   8 bits
                            +-/-----------+
                             /      |
                            /       |
                           /        |
eax:  000000000000000000000000 00000000       32 bits
          sign extension         copy
```
<+56> : Remove the 16 bytes allocated to the function.
```
   0x0804849f <+59>:	pop    esi
   0x080484a0 <+60>:	pop    edi
   0x080484a1 <+61>:	pop    ebp
   0x080484a2 <+62>:	ret
```
<+59> - <+60> : Pop `esi` and `edi` to retrieve their old values.  
<+61> : Retrieve the old `ebp`.  
<+62> : Retrieve the next instructions after the call of the `main()` function !


# verify_user_pass
```
Dump of assembler code for function verify_user_pass:
   0x080484a3 <+0>:	push   ebp
   0x080484a4 <+1>:	mov    ebp,esp
   0x080484a6 <+3>:	push   edi
   0x080484a7 <+4>:	push   esi
   0x080484a8 <+5>:	mov    eax,DWORD PTR [ebp+0x8]
   0x080484ab <+8>:	mov    edx,eax
   0x080484ad <+10>:	mov    eax,0x80486b0
   0x080484b2 <+15>:	mov    ecx,0x5
   0x080484b7 <+20>:	mov    esi,edx
   0x080484b9 <+22>:	mov    edi,eax
   0x080484bb <+24>:	repz cmps BYTE PTR ds:[esi],BYTE PTR es:[edi]
   0x080484bd <+26>:	seta   dl
   0x080484c0 <+29>:	setb   al
   0x080484c3 <+32>:	mov    ecx,edx
   0x080484c5 <+34>:	sub    cl,al
   0x080484c7 <+36>:	mov    eax,ecx
   0x080484c9 <+38>:	movsx  eax,al
   0x080484cc <+41>:	pop    esi
   0x080484cd <+42>:	pop    edi
   0x080484ce <+43>:	pop    ebp
   0x080484cf <+44>:	ret
End of assembler dump.
```

## verify_pass explanations
Same explanations as `verify_user_name` : *`strncmp(password, "admin", 5)`*.  
Except that we retrieve the argument passed to the function (`mov    eax,DWORD PTR [ebp+0x8]`).  
Lets's see how the stack should look like :
```
                   High addresses

                |     OLD_EBP     |
                +-----------------+    ----+
                :                 :        |
                :   extra space   :        |
                :   (alignment)   :        |
                :                 :        |
                +-----------------+        |
                :      verify     :        |
 EBP+0x64 =>    +-----------------+        |
                :                 :        |
                :                 :        |
                :                 :        |
                :                 :        |
                :                 :        |
                :                 :        |
                :       uni*      :        |
                :                 :        |
                :                 :        |
                :                 :        |
                :                 :        |
                :                 :        |
                :                 :        |   main stackframe
                +-----------------+        |  96 bytes allocated
                :     pwd[64]     :        |
 EBP+0x24 =>    +-----------------+        |
                :                 :        |
                :                 :        |
                :                 :        |
                :       uni*      :        |
                :                 :        |
                :                 :        |
                +-----------------+        |
                :      stdin      :        |
 EBP+0x10 =>    +-----------------+        |
                :       100       :        |
  EBP+0xc =>    +-----------------+        |
                :  "nope, [...]"  :        |
  EBP+0x8 =>    +-----------------+        |
                :    MAIN_EIP     :        |
  EBP+0x4 =>    +-----------------+        |
                :    MAIN_EBP     :        |
EBP / ESP =>    +-----------------+    ----+  verify_user_pass stackframe 0 bytes allocated
                   Low addresses

*uni : uninitialized
```