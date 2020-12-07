
#include "version.h"
#include <iostream>

int main(int argc, const char * argv[]) 
{
    std::cout << "Automatic version generation sample project.\n"; 
    std::cout << "VER_MAJOR  = " << VER_MAJOR  << std::endl;
    std::cout << "VER_MINOR  = " << VER_MINOR  << std::endl;
    std::cout << "VER_PATCH  = " << VER_PATCH  << std::endl;
    std::cout << "VER_STRING = " << VER_STRING << std::endl;

    return 0;
}
