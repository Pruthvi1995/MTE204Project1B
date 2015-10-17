function [ Ui ] = expUi( A, B, D, F, Uim1, Uip1 )
    Ui = inv(B)*(Uip1*A-F+D*Uim1);
end

