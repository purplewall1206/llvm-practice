#include "header.h"


int b(int c) {
    char *x = "entry exit test";
    if (c == 1) {
        printf("func b trigger: %d\n", a(x));
        return 1;
    } 

    if (c == 2) {
        printf("func b trigger at 2\n");
        return 2;
    }
    printf("func b trigger at c\n");
    return 0;
}

int main()
{
    printf("trigger main\n");
    b(0);
    b(1);
    b(2);
    return 0;
}