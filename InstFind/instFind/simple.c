#include <stdio.h>

int a()
{
    printf("trigger function a\n");
    return 0;
}

int main()
{
    a();
    printf("trigger function main\n");
    return 1;
}