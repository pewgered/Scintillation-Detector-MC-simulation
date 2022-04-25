function [d1,d2] = getDistanceToCylinder(position, direction, radius)
%([-2,0,0],[1,0,0],1)
%([0,0,1],[0,0,1],1)

a=direction(1)^2+direction(2)^2;
if a==0
    d1=inf;
    d2=inf;
else
    b=2*(position(1)*direction(1)+position(2)*direction(2));
    c=position(1)^2+position(2)^2-radius^2;
    discriminant=b^2-4*a*c;
    if discriminant>0
        discriminant=sqrt(discriminant);
        d1=(-b+discriminant)/(2*a);
        d2=(-b-discriminant)/(2*a);
    else
        d1=inf;
        d2=inf;
    end
end

end