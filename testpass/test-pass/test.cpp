#include <iostream>

int main()
{
    int a = 0;
    int b = 10;
    int c = a+b;
    std::cout << "test output " << (a+b) <<  std::endl;
    for (int i = 0;i < 10;i++) {
        c--;
    }
    return 0;
}