#include <stdint.h>
#include "CppUTest/TestHarness.h"
#include "CppUTestExt/MockSupport_c.h"
#include "CppUTest/MemoryLeakDetectorNewMacros.h"
#include "CppUTest/MemoryLeakDetectorMallocMacros.h"

extern "C"
{
    #include <calculation_routines.h>
}


TEST_GROUP(Calculations_TestGroup)
{
    void setup()
    {
    }

    void teardown()
    {
    }
};


TEST(Calculations_TestGroup, check_add)
{
    BYTES_EQUAL(5, add(2,3));
}

TEST(Calculations_TestGroup, check_substract)
{
    BYTES_EQUAL(7, substract(10,3));
}

TEST(Calculations_TestGroup, check_multiply)
{
    BYTES_EQUAL(6, multiply(2,3));
}

TEST(Calculations_TestGroup, check_divide)
{
    BYTES_EQUAL(5, divide(10,2));
}

