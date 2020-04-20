
#include "Gain_limited.h"


Gain_limited::Gain_limited ( int lower_limit, int upper_limit)
    :
    m_lower_limit   { lower_limit}   ,
    m_upper_limit   { upper_limit}
{}


int Gain_limited::gain ( int input, int gain)                           const
{
    int result                              { input * gain}                 ;

    if ( result > m_upper_limit)
        result =                            m_upper_limit                   ;
    else if ( result < m_lower_limit)
        result =                            m_lower_limit                   ;

    return                                  result                          ;
}

