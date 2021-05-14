#include <stdio.h>


void printx(unsigned long addr ) {
    printf("%016lx\n", addr);
}

// void test(unsigned long addr ) {
//     char *x = (char *)addr;
// }
#define ketag_offset        (unsigned long)0xdfffc88000000000
static inline unsigned long ketag_addr_cal(unsigned long addr)
{
    return (addr >> 3) + ketag_offset;
}

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
void ketag_report(unsigned long addr) {
    addr++;
}

void ketag_check(unsigned long addr, char extID) 
{
    unsigned long tagaddr;
    char *val;
    // =======easy mode=======
    if (addr >= (unsigned long)0xffffc90000000000 
        && addr <= (unsigned long)0xffffeaffffffffff) {
        return ;
    }
    // =======================
    tagaddr = ketag_addr_cal(addr);
    val = (char *) tagaddr;
    if (val[0] & extID) {
        // violation
        ketag_report(addr);
        // return;
    }
}

void ketag_print_func(char* name) {
    printf("ketag---%s\n", name);
}

void testaddr(int* x) {
    printf("test addr %016lx, %d\n", x, *x);
}


int main()
{
    int x = 10;
    // int y = -12;
    //  printf("get x addr: %016lx - %d\n", &x, x);
    // a(x);
    // a(y);
    int *y;
    // *y = 2;
    testaddr(&x);
    testaddr(y);
    return 0;
}