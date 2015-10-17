function [ U1, U2 ] = expU1U2( Uim1, Ui, Uip1, d_t )
    U1 = (Uip1-Uim1)/(2*d_t);
    U2 = (Uip1-2*Ui+Uim1)/(d_t*d_t);
end

