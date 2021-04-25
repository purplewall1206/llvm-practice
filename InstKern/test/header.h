#include <stdio.h>
// static inline __attribute__((always_inline))
 unsigned long getaddr(unsigned long addr)
{
    addr >>= 3;
    addr <<= 3;
    printf("getaddr:%016lx\n", addr);
    return addr;
}

// unsigned long getaddr1(unsigned long addr) {
//     addr >>= 3;
//     addr <<= 3;
//     printf("getaddr:%016lx\n", addr);
//     return addr;
// }