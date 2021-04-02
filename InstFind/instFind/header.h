#include <stdio.h>

int x(int c) {
    if (c == 0) {
        printf("c = %d\n", c);
        return 1;
    } else {
        printf("c = %d\n", c);
        return 2;
    }
    return 3;
}

void printtail(char * funcname) {
    printf("%s tail triggered\n", funcname);
}

void print_lx64(char *varname, unsigned long addr) {
    printf("%s  :  0x%lx\n", varname, addr);
}

#define \
get_rbp() ({\
    unsigned long rbp = 0; \
    asm("movq %%rbp, %0\n\t":"=r"(rbp)); \
    printf("current rbp: %lx\n", rbp); \
    rbp;\
})


