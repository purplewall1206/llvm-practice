// #include "header.h"

#include <stdio.h>
unsigned long getaddr(unsigned long addr)
{
    addr >>= 3;
    addr <<= 3;
    printf("getaddr:%016lx\n", addr);
    return addr;
}
int x()
{
    getaddr(0);
}