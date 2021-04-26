#include <stdio.h>


void printx(unsigned long addr ) {
    printf("%016lx\n", addr);
}

// void test(unsigned long addr ) {
//     char *x = (char *)addr;
// }

int a(int c) {
    printf("get c addr: %016lx - %d\n", &c, c);
    if (c > 0) {
        printf("+%d\n", c);
        return 1;
    } else {
        printf("%d\n",c );
        return -1;
    } 
    
    return 0;
}   


int main()
{
    int x = 10;
    int y = -12;
    a(x);
    a(y);
    return 0;
}