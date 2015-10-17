function [ Fglobal ] = assembleF( initials, n )
    Fglobal = zeros(2*n, 1);
    for i = 1:n
        if (cosd(initials(i, 8)) == 0)
            Fglobal(2*i-1) = 0;
        else
            Fglobal(2*i-1) = cosd(initials(i, 8))*initials(i, 7);
        end
        if (sind(initials(i, 8)) == 0)
            Fglobal(2*i) = 0
        else
            Fglobal(2*i) = sind(initials(i, 8))*initials(i, 7);
        end
        
    end

end

