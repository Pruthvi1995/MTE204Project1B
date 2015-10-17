function [ f ] = uFunc ( F, m, k, c, t, v0, u0)
wn = sqrt(k/m);
z = c/(2*m*wn);
theta = atan(z/sqrt(1-z*z));
wd = wn*sqrt(1-z*z);
a = exp(-z*wn*t); 

f = F/k-F*a*cos(wd*t-theta)/(k*sqrt(1-z*z))+a*[(v0+z*wn*u0)*sin(wd*t)/wd+u0*cos(wd*t)];

end

