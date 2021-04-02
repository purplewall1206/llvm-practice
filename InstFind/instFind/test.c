#include "header.h"

int main()
{
    int res = x(1);
    printf("x(1) %d\n", res);
    res = x(100);
    printf("x(100) %d\n", res);
    int (*a)(int );
    a = x;
    res = a(12);
    printf("indirect c %d\n", res);
    void (*b)(char*, unsigned long);
    b = print_lx64;
    b("abcd", 0xbeef);
    get_rbp();


    // unsigned long rbp = 0; 
    // asm("movq %%rbp, %0\n\t":"=r"(rbp)); 
    // printf("current rbp: %lx\n", rbp); 
    return 0;
}