On remarque que le programme fait decryptage par xor avec comme clé 0x1337d00d - atoi(password).

La chaine cryptée est : "Q}|u`sfg~sf{}|a3".
La chaine à trouver est : "Congratulations!"

On remarque que 'Q' ^ 'C' = 0x12.

La clé de décryptage est donc 0x12.

On doit donc rentrer 0x1337d00d - 0x12 = 0x1337CFFB. (322424827 en decimal)

On récupère ainsi un shell et on n'a plus qu'à :

cat /home/users/level04/.pass

--------------------------------------------------------------------------------------

If you look at source.c, it might look little bit frightening. In fact the program is doing 5 things:

It takes one input: an integer;
This integer is subtracted to 0x1337d00d (or decimal 322424845);
Then we have a switch cases with the subtraction result, cases are: 1, 2, 3, 4, 5, 6, 7, 8, 9, 16, 17, 18, 19, 20, 21 - each cases are calling decrypt with 1, 2, 3, and so on;
decrypt do XOR operation on each character of the string "Q}|u`sfg~sf{}|a3" with the subtraction result we get earlier;
Finally it compares the new string with "Congratulations!", if it matches: win!
Exploit
We know that our input must match one of the cases. Thus we can generate the list of integers to be tested:

>>> l = [1,2,3,4,5,6,7,8,9,16,17,18,19,20,21]
>>> a2 = 0x1337d00d
>>> a2
322424845
>>> for a1 in l:
...     print a2 - a1
...
322424844
322424843
322424842
322424841
322424840
322424839
322424838
322424837
322424836
322424829
322424828
322424827
322424826
322424825
322424824
Not more than 15 solutions to try. But as we are lazy, we can create a small program (available in Resources/try_input.py) to test integers that will fit each cases:

import os

cases = [1,2,3,4,5,6,7,8,9,16,17,18,19,20,21]
constant = 0x1337d00d
print "--- Start"
for l in cases:
    arg = constant - l
    cmd = "(echo \"" + str(arg) + "\"; cat) | ./level03"
    print "Testing\t\t" + cmd
    os.system(cmd)
print "--- Done"
Launch it:

[Press Enter to scroll]
Testing		(echo "322424828"; cat) | ./level03
***********************************
*		level03		**
***********************************
Password:
Invalid Password

cat: write error: Broken pipe
Testing		(echo "322424827"; cat) | ./level03
***********************************
*		level03		**
***********************************

whoami
level04
cat /home/users/level04/.pass
kgv3tkEb9h2mLkRsPkXRfc2mHbjMxQzvb2FrgKkf
Password:Testing		(echo "322424826"; cat) | ./level03
***********************************
*		level03		**
***********************************
Password:
[Press Enter to scroll if you wan't to continue]
It stopped at 322424827! Which is the case 18. If you wan't to convince yourself, you can try it with python:

>>> final = ""
>>> for letter in "Q}|u`sfg~sf{}|a3":
...     xor_letter = ord(letter) ^ 18
...     final = final + chr(xor_letter)
...
>>> print final
Congratulations!
