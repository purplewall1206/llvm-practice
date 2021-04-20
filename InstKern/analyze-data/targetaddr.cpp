

// #include <linux/printk.h>
#include <stdio.h>

unsigned int count = 0;

unsigned long user_end =         0x00007fffffffffff;
unsigned long hugegap =          0xffff7fffffffffff;
unsigned long hypervisor_begin = 0xffff800000000000;
unsigned long hypervisor_end =   0xffff887fffffffff;
unsigned long phymaps_begin =    0xffff888000000000;
unsigned long phymaps_end =      0xffffc87fffffffff;
unsigned long vmalloc_begin =    0xffffc90000000000;
unsigned long vmalloc_end =      0xffffe8ffffffffff;
unsigned long vmemmap_begin =    0xffffea0000000000;
unsigned long vmemmap_end =      0xffffeaffffffffff;
// 有个空间，检测一下有没有访问
unsigned long kernel_begin =     0xffffffff80000000;
unsigned long kernel_end =       0xffffffff9fffffff;
unsigned long module_start =     0xffffffffa0000000;
unsigned long module_end =       0xfffffffffeffffff;
unsigned long upper_begin =            0xffffffffff000000;

unsigned int c_user = 0;
unsigned int c_hypervisor = 0;
unsigned int c_phymaps = 0;
unsigned int c_vmalloc = 0;
unsigned int c_vmemmap = 0;
unsigned int c_kernel = 0;
unsigned int c_module = 0;
unsigned int upper = 0;

void c_print(void) {
    printf("==================\ncount:%u\n", count);
    printf("c_user:%u\n",c_user );
    printf("c_hypervisor:%u\n", c_hypervisor);
    printf("c_phymaps:%u\n", c_phymaps);
    printf("c_vmalloc:%u\n", c_vmalloc);
    printf("c_vmemmap:%u\n", c_vmemmap );
    printf("c_kernel:%u\n", c_kernel);
    printf("c_module:u\n", c_module);
    printf("upper:%u\n=======================\n\n", upper);
    
}

bool storeaddr(unsigned long addr) {
    if (addr <= user_end) {
        c_user++;
    } else if (addr >= hypervisor_begin && addr <= hypervisor_end) {
        c_hypervisor++;
    } else if (addr >= phymaps_begin && addr <= phymaps_end) {
        c_phymaps++;
    } else if (addr >= vmalloc_begin && addr <= vmalloc_end) {
        c_vmalloc++;
    } else if (addr >= vmemmap_begin && addr <= vmemmap_end) {
        c_vmemmap++;
    } else if (addr >= kernel_begin && addr <= kernel_end) {
        c_kernel++;
    } else if (addr >= module_start && addr <= module_end) {
        c_module++;
    } else if (addr >= upper_begin) {
        upper++;
    }
    // ++count;
    if (++count % 100 == 0) {
        c_print();
    }
    return true;
}

