#include <stdio.h>

int main() {
    char val = '0';
    char *valaddr = &val;
    *valaddr = 'f';
    printf("%016lx- %c\n", valaddr, *valaddr);
    return 0;
}