#include <stdio.h>

int a(int c) {
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