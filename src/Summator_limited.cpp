
#include "Summator_limited.h"


Summator_limited::Summator_limited ( int lower_limit, int upper_limit)
    :
    m_lower_limit   { lower_limit}   ,
    m_upper_limit   { upper_limit}
{}


int Summator_limited::sum ( int lhs, int rhs)                           const
{
    int result                          { lhs + rhs}                        ;

    if ( result > m_upper_limit)
        result =                        m_upper_limit                       ;
    else if ( result < m_lower_limit)
        result =                        m_lower_limit                       ;

    return                              result                              ;
}

