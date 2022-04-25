function [v] = getIsotropicDirectionIn(angle)
v=zeros(1,3);

rho=(1-cos(angle))*rand()+cos(angle);
phi=2*pi*rand();

%theta=acos(rho);
%r=sin(theta);
%kipr�b�ltam ezzel is, sok futtat�s eset�n is minim�lis elt�r�s van
%a k�t m�dszer k�z�tt, de az ut�bbi bizonyult gyorsabbnak.
r=sqrt(1-rho^2); 

v(1)=r*cos(phi);
v(2)=r*sin(phi);
v(3)=rho;

end