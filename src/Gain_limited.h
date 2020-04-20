
class Gain_limited {
public:
    Gain_limited ( int lower_limit , int upper_limit)                       ;

    int gain ( int input, int gain)                                   const ;

private:
    int     m_lower_limit                                                   ;
    int     m_upper_limit                                                   ;
};
