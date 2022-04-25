function [v] = getIsotropicDirectionIn(angle)
v=zeros(1,3);

rho=(1-cos(angle))*rand()+cos(angle);
phi=2*pi*rand();

%theta=acos(rho);
%r=sin(theta);
%kipróbáltam ezzel is, sok futtatás esetén is minimális eltérés van
%a két módszer között, de az utóbbi bizonyult gyorsabbnak.
r=sqrt(1-rho^2); 

v(1)=r*cos(phi);
v(2)=r*sin(phi);
v(3)=rho;

end