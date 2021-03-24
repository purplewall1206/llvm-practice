#include <stdio.h>

#define DUMP(func, call) \
	printf("%s: func = %p, called by = %p\n", __FUNCTION__, func, call)
 
 
void __attribute__((no_instrument_function))
__cyg_profile_func_enter(void *this_func, void *call_site)
{
	DUMP(this_func, call_site);
}
 
 
void __attribute__((no_instrument_function))
__cyg_profile_func_exit(void *this_func, void *call_site)
{
	DUMP(this_func, call_site);
    // printf("\n");
}

int a(char *s) {
    printf("func a trigger: %s\n", s);
    return 0;
}

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