Basically, this program opens the .pass file that contains the flag we look for, put its content to a buffer declared on stack, gets a username and a password from the standard input, then spawn a shell if the password entered by the user is equal to the .pass file content.

The first clue we get from this is that the flag is stored in a buffer on the stack, so maybe we can find a way to read this buffer.

Here, the vulnerability comes from printf which is called at the end of the program, when the password provided is different from the one of .pass, and only takes one argument, the username acquired from the standard input. We will use a python script (Resources folder attached) to dump the stack thanks to a format string attack. By doing so, we hope to reach the buffer used to read the content of the .pass file. Let's try this!

----------------------------

This program has a username and password prompt using fgets(). After disassembling we can see that before these prompts occur the process opens and saves the contents of /home/users/level03/.pass to a buffer on the stack and does nothing with it.

Additionally, the contents of the username prompt are displayed on screen with an unprotected printf()! This means that if we include %p or %x modifiers with x$ parameter specifiers we can print anything up on the stack, including the copy of the flag (as we are in a 64bit binary, every increase in the x$ specifier will read 8 bytes higher on the stack).

The buffer we want to print is at RBP - 0xa0 ; 160 The size of the stack frame is 0x120 ; 288

Parameter offset to reach our buffer = (288 - 160) / 8 + 1 = 22

The length of the flag string is 40 so we will want to print 5 * 8.

./level02
===== [ Secure Access System v1.0 ] =====
/***************************************\
| You must login to access this system. |
\**************************************/
--[ Username: %22$p%23$p%24$p%25$p%25$p
--[ Password:
*****************************************
0x756e5052343768480x45414a35617339510x377a7143574e67580x354a35686e4758730x354a35686e475873 does not have access!
Now all that is left to do is convert the printed memory into a readable string!

- Remove the 0x
- split into 5 blocks
- Convert to ASCII
- Revert endian
