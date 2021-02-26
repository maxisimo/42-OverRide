#!/bin/bash
# This script will allow to test the pseudo code in source.c file by copy it in the folder /tmp in the VM

# -------------------------------- PREREQUIRES -------------------------------- #
#                            From your local machine                            #
#       Copy the source and the script files in the tmp folder in your VM       #
#                 scp -P 4242 path/source.c level01@VM_IP:/tmp                  #
#                 scp -P 4242 path/script.sh level01@VM_IP:/tmp                 #
#                                                                               #
#                 pwd: uSq2ehEGT6c9S24zbshexZQBXUGrncxn5sD5QfGL                 #
#                                                                               #
#                                                                               #
#                                                                               #
#                   Don't forget to run it ;) bash script.sh                    #
# ----------------------------------------------------------------------------- #

# Compile the program
gcc source.c -o ft_level00

# Set SUID to give root user permissions
chmod u+s ft_level00

# Add write and execution permissions on home directory
chmod +wx ~

# Move the program to home directory
mv ft_level00 ~


# Then you have to run the program and cat .pass as level0 by taping manually these commands

# ------------------------------------ #
#              su level00              #
#    /home/users/level01/ft_level00    #
#    cat /home/users/level01/.pass     #
# ------------------------------------ #