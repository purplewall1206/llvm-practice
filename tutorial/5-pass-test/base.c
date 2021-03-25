#include <stdio.h>

void func1() {
  printf("Called from func1\n");
}

void func2() {
  printf("Calling func1 from func2\n");
  func1();
}

void func3() {
    printf("func3 : ");
    for (int i = 0; i< 5;i++) {
        if (i%2 == 0)
            printf("%d ", i);
    }
    for (int i = 0;i < 3;i++) {
        for (int j = 0;j < 4;j++) {
            printf(" (%d, %d) ", i, j);
        }
    }
    printf("\n");
}

int main()
{
  func1();
  func2();
  func3();
  printf("End of main\n");
  return 0;
}