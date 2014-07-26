
#include <iostream>
#include "lib1.hpp"

int main(int argc, const char ** argv)
{
    for (int i = 0; i < argc; i++)
    {
        std::cout << i << " : " << argv[i] << std::endl;
    }

    std::cout << "sum(1, 2) = " << sum(1, 2) << std::endl;
    return 0;
}
