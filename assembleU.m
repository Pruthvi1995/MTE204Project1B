function [ U, U1, U2 ] = assembleU( initials, n )

U = zeros(2*n, 1);
U1 = zeros(2*n, 1);
U2 = zeros(2*n, 1);
for i = 1:n
    U(2*i-1) = initials(i, 1);
    U(2*i) = initials(i, 2);
    U1(2*i-1) = initials(i, 3);
    U1(2*i) = initials(i, 4);
    U2(2*i-1) = initials(i, 5);
    U2(2*i) = initials(i, 6);
end


end

