
class Summator_limited {
public:
    Summator_limited (
            int lower_limit,
            int upper_limit)                                                ;

    constexpr int sum ( int lhs, int rhs) const
    {
        int result                          { lhs + rhs}                        ;

        if      ( result > m_upper_limit)
            result =                  m_upper_limit                       ;

        else if ( result < m_lower_limit)
            result =                  m_lower_limit                       ;

        return                              result                              ;
    }

private:
    int m_lower_limit                                                       ;
    int m_upper_limit                                                       ;
};
