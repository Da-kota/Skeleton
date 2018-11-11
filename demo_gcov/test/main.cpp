
// http://blog.wingman-sw.com/archives/category/cpputest

#include "CppUTest/CommandLineTestRunner.h"

int main(int ac, char** av)
{
   return CommandLineTestRunner::RunAllTests(ac, av);
}
