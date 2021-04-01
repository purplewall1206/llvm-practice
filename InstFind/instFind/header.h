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

void printtail() {
    printf("\ntail triggered\n");
}

#define \
get_rbp() ({\
    unsigned long rbp = 0; \
    asm("movq %%rbp, %0\n\t":"=r"(rbp)); \
    printf("current rbp: %lx\n", rbp); \
    rbp;\
})


