#include <calculation_routines.h>

uint8_t add(uint8_t x, uint8_t y)
{
    return x+y;
}

uint8_t substract(uint8_t x, uint8_t y)
{
    return x-y;
}

uint8_t multiply(uint8_t x, uint8_t y)
{
    return x*y;
}

uint8_t divide(uint8_t x, uint8_t y)
{
    if(y != 0)
        return x/y;
    else
        return 0;
}

