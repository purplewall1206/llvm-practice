#include <stdio.h>
 
int a(int x) {
    if (x == 1) {
        printf("function a : %d\n", x);
        return 0;
    } else {
        printf("function a-: %d\n", x);
        return 2;
    }
    return 3;
}

int main() {
    printf("call a : %d\n", a(1));
    int (*p) (int x);
    p = a;
    printf("indirect call a : %d\n", p(2));

    int c = 0;
    c = 10;
    
    return 0;
}