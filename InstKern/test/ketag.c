#include <stdio.h>

#define ketag_offset        (unsigned long)0xdfffc88000000000
// ketag [start, end)
#define ketag_base          (unsigned long)0xffffb88000000000
#define ketag_end           (unsigned long)0xffffc88000000000
// ketag 's tag, we used it in general protection fault handler
#define ketag_base_tag      (unsigned long)0xffffbf9000000000
#define ketag_base_tag_end  (unsigned long)0xffffc19000000000

unsigned long cal_tag(unsigned long addr) {
    return (addr >> 3) + ketag_offset;
}

// eid 的tag由llvm 生成就行
void set_tag(unsigned long addr, char val) {
    addr = (addr >> 3) + ketag_offset;
    char *x = (char*) addr;
    x[0] = val;
}

// void set_tag_long()
void report_bug(unsigned long addr) {
    // dump_stack();
    // return;
}

// eid 的tag由llvm 生成就行
// char val = (char)(1 << eid);
void check_tag(unsigned long addr, char val) {
    unsigned long xaddr = (addr >> 3) + ketag_offset;
    char *x = (char*) xaddr;
    if (x[0] & val) {
        report_bug(addr);
    }
}