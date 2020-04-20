#include "CppUTest/TestHarness.h"
#include "Summator_limited.h"
#include "Gain_limited.h"

static  const int   upper_limit                 {   99 }                    ;
static  const int   lower_limit                 { -101 }                    ;

TEST_GROUP ( Limited_summing)
{
    Summator_limited
        const       sum_ltd        { lower_limit, upper_limit }             ;
}                                                                           ;

TEST_GROUP ( Limited_gaining)
{
    Gain_limited
        const       gain_ltd       { lower_limit, upper_limit }             ;
}                                                                           ;

TEST ( Limited_summing, upper_limit)
{
    CHECK_EQUAL ( upper_limit,  sum_ltd  .sum   (  300, 500 ) )             ;
    CHECK_EQUAL ( upper_limit,  sum_ltd  .sum   (   34,  66 ) )             ;
    CHECK_EQUAL ( upper_limit,  sum_ltd  .sum   (   33,  66 ) )             ;
}

TEST ( Limited_summing, summing)
{
    CHECK_EQUAL ( upper_limit,  sum_ltd  .sum   (   33,  66 ) )             ;
    CHECK_EQUAL (          98,  sum_ltd  .sum   (   33,  65 ) )             ;
    CHECK_EQUAL (          60,  sum_ltd  .sum   (   10,  50 ) )             ;
    CHECK_EQUAL (           8,  sum_ltd  .sum   (    3,   5 ) )             ;
    CHECK_EQUAL (           0,  sum_ltd  .sum   (    0,   0 ) )             ;
    CHECK_EQUAL (         -50,  sum_ltd  .sum   (  -30, -20 ) )             ;
    CHECK_EQUAL (        -100,  sum_ltd  .sum   (  -50, -50 ) )             ;
    CHECK_EQUAL ( lower_limit,  sum_ltd  .sum   (  -51, -50 ) )             ;
}

TEST ( Limited_summing, lower_limit)
{
    CHECK_EQUAL ( lower_limit,  sum_ltd  .sum   (  -51, -50 ) )             ;
    CHECK_EQUAL ( lower_limit,  sum_ltd  .sum   (  -51, -51 ) )             ;
    CHECK_EQUAL ( lower_limit,  sum_ltd  .sum   ( -500, 300 ) )             ;
}

TEST ( Limited_gaining, Gain_limited)
{
    CHECK_EQUAL ( upper_limit,  gain_ltd .gain  (  300, 500 ) )             ;
    CHECK_EQUAL (          27,  gain_ltd .gain  (    9,   3 ) )             ;
    CHECK_EQUAL (           8,  gain_ltd .gain  (    2,   4 ) )             ;
    CHECK_EQUAL ( lower_limit,  gain_ltd .gain  ( -500, 300 ) )             ;
}
