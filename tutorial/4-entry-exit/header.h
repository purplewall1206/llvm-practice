#ifndef _HEADER_H
#define _HEADER_H

#include <stdio.h>

#define DUMP(func, call) \
	printf("%s: func = %p, called by = %p\n", __FUNCTION__, func, call)
 
 
void __attribute__((no_instrument_function))
__cyg_profile_func_enter(void *this_func, void *call_site);
 
 
void __attribute__((no_instrument_function))
__cyg_profile_func_exit(void *this_func, void *call_site);

int a(char *s);

#endif