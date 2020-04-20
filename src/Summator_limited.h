
class Summator_limited {
public:
    Summator_limited (
            int lower_limit,
            int upper_limit)                                                ;

    int sum ( int lhs, int rhs)                                     const   ;

private:
    int m_lower_limit                                                       ;
    int m_upper_limit                                                       ;
};
