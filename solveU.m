function [ U ] = solveU( X, U, B )
    X = [1 2 3 4 5;
        6 7 8 9 10;
        11 12 13 14 15;
        16 17 18 19 20;];
    U = [nan; 5; nan; 4; nan;];
    B = [2; nan; 4; nan; 6;];
        


    cu = 0;
    ck = 0;
    unknown = zeros(1, 1);
    known = zeros(1, 1);
    for i = 1:size(U, 1);
        if (isnan(U(i)))
            cu = cu+1;
            unknown(cu) = U(i);
        else
            ck = ck+1;
            uknown(ck) = U(i);
        end
    end
    
    
end

