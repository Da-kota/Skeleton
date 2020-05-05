#include "CppUTest/TestHarness.h"
#include "dummy.h"

constexpr bool all_tests_formulated { false};

TEST_GROUP ( group_1_name)
{
    // create objects under test
    dummy d;

    void setup ()
    {
        // init
    }

    void teardown ()
    {
        // clean-up
    }
}                                                                           ;

TEST_GROUP ( group_2_name)
{
    // create objects under test

    void setup ()
    {
        // init
    }

    void teardown ()
    {
        // clean-up
    }
}                                                                           ;

TEST ( group_1_name, tests_formulated)
{
    CHECK ( all_tests_formulated);
}

