#include <stdio.h>
#include <string.h>

int main(void)
{
    unsigned char code[] = "";

    void (*s)() = (void *)code;
    s();

    return 0;
}
