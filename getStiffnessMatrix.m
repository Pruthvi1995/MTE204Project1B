function stiffnessMatrix  = getStiffnessMatrix( c, s )
%   Returns the local K matrix using the sine and cosine value passed in

stiffnessMatrix = [c^2 c*s -c^2 -c*s;
                   c*s s^2 -c*s -s^2;
                   -c^2 -c*s c^2 c*s;
                   -c*s -s^2 c*s s^2;];
end

