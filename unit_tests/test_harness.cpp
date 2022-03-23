
#include "Summator_limited.hpp"
#include "Gain_limited.hpp"
#include "catch.hpp"

constexpr bool all_tests_formulated { true};

SCENARIO ( "all tests should be formulated", "[test framework]" )
{
    REQUIRE ( all_tests_formulated );
}

TEST_CASE( "Summator_limited correctly sums and limits", "[Summator_limited]" )
{
    constexpr int  limit_low      { -10};
    constexpr int  limit_high     {  12};

    Summator_limited  summer ( limit_low, limit_high);

    REQUIRE ( summer.sum ( 0,  0) ==  0);
    REQUIRE ( summer.sum ( 1,  2) ==  3);
    REQUIRE ( summer.sum ( 5, -8) == -3);

    SECTION( "sums above upper_limit are limited" )
    {
        REQUIRE ( summer.sum ( 20, 30) == limit_high );
    }

    SECTION( "sums below lower_limit are limited to lower_limit" )
    {
        REQUIRE ( summer.sum ( -20, -30) == limit_low );
    }
}
