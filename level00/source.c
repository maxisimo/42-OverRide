#include <stdio.h>
#include <stdlib.h>

int     main(void)
{
    int     pwd;

    puts("***********************************");
    puts("* \t     -Level00 -\t\t  *");
    puts("***********************************");
    printf("Password:");
    scanf("%d", &pwd);
    if (pwd != 5276)
    {
        puts("\nInvalid Password!");
        return (1);
    }
    puts("\nAuthenticated!");
    system("/bin/sh");
    return (0);
}
