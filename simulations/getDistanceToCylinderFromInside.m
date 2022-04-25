function [d] = getDistanceToCylinderFromInside(position, direction, top, bottom, radius)
%([0,0,0],[0,0,1],2,-1,5)   =>2
%([0,0,0],[0,0,-1],2,-1,5)  =>1
%([1,0,0],[1,0,0],2,-1,5)   =>4
%([1,0,0],[-1,0,0],2,-1,5)  =>6
%A program el�sz�r megvizsg�lja, hogy egy�ltal�n a hengeren bel�l van-e
%a r�szecske, ha nem akkor v�gtelent ad vissza

if (position(3)<=top && position(3)>=bottom && (position(1)^2+position(2)^2)<=radius^2)

    [d1,d2]=getDistanceToCylinder(position,direction,radius);
    dtop=getDistanceToPlane(position,direction,top);
    dbot=getDistanceToPlane(position,direction,bottom);

    d=min(max(d1,d2),max(dtop,dbot));

else
    d=inf;

end
    
end