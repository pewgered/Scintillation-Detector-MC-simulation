function [ sourceDirection ] = getDirectionFromSource(radius, heigth, rSource)
%izotróp módon sorsol egy irányt attól függõen, hogy a hengert érintõ körben
%benne van vagy nincs

%(4,6,[0,0,-4])  %(1,1,[0,0,-2])   %(1,1,[0,0,-10])

rSphere=sqrt(radius^2+(heigth/2)^2);
rSourceDistance=sqrt(rSource(1)^2+rSource(2)^2+rSource(3)^2);
phi=asin(rSphere/rSourceDistance);

if rSphere>rSourceDistance
    sourceDirection=getIsotropicDirection;
else
    originalDirection=getIsotropicDirectionIn(phi);
    sourceDirection=transformDirection(originalDirection,-(rSource/rSourceDistance));
end

end

