function [ Uip1 ] = expUip1( A, B, D, F, Uim1, Ui )
    Uip1 = inv(A)*(F-B*Ui-D*Uim1);
end

