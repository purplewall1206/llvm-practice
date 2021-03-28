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
    unsigned long rbp = 0;

    asm("movq %%rbp, %0\n\t" 
            : "=r"(rbp)); 
    

    printf("trigger main rbp: %lx\n", rbp);
    b(0);
    b(1);
    b(2);

    // printf("macros: %s  %s  %s   %s   %s\n", __FUNCTION__, __FILE__, __LINE__, __DATE__, __TIME__);
    printf("macros: %s  \n", __FUNCTION__);
    printf("macros: %s  \n",  __FILE__);
    printf("macros: %d  \n", __LINE__);
    printf("macros: %s  \n",  __DATE__);
    printf("macros: %s  \n",  __TIME__);
    printf("__VERSION__: %s\n", __VERSION__);
    return 0;
}