function [ Uim1 ] = expUim1( A, B, D, F, Ui, Uip1 )
    Uim1 = inv(D)*(A*Uip1-F+B*Ui);
end

