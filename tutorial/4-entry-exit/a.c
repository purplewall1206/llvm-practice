#include "header.h"

void __attribute__((no_instrument_function))
__cyg_profile_func_enter(void *this_func, void *call_site)
{
	DUMP(this_func, call_site);
        unsigned long rbp = 0;

    asm("movq %%rbp, %0\n\t" 
            : "=r"(rbp)); 
    printf("entry rbp:%lx\n", rbp);
}
 
 
void __attribute__((no_instrument_function))
__cyg_profile_func_exit(void *this_func, void *call_site)
{
	DUMP(this_func, call_site);
    // printf("\n");
        unsigned long rbp = 0;

    asm("movq %%rbp, %0\n\t" 
            : "=r"(rbp)); 
    printf("exit rbp:%lx\n", rbp);
}

int a(char *s) {
    printf("func a trigger: %s\n", s);
    return 0;
}