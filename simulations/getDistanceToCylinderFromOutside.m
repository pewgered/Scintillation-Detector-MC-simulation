function [d] = getDistanceToCylinderFromOutside(position, direction, top, bottom, radius)
%([0,0,0],[0,0,1],2,1,3)    =>1
%([-2,0,2],[1,0,0],1,-1,1)  =>1
%([2,0,0],[0,0,1],2,1,1)    =>inf
%([-2,0,2],[1,0,0],1,-1,1)  =>inf

d=inf;
[d1,d2]=getDistanceToCylinder(position,direction,radius);

dist=inf;

if (direction(1)==0 && direction(2)==0)
    dist=sqrt(position(1)^2+position(2)^2);
end

if not ((min(d1,d2)==inf && dist>radius) | max(d1,d2)<0 | ((position(3)>top & direction(3)>0) | (position(3)<bottom & direction(3)<0)))
    
    if d1*d2>0
        dcyl=min(d1,d2);
    else
        dcyl=max(d1,d2);
    end
    
    z=position(3)+dcyl*direction(3);
    
    if (z>top || z<bottom)
        dcyl=inf;
    end
    
    dtop=getDistanceToPlane(position,direction,top);
    xtop= position(1)+dtop*direction(1);
    ytop= position(2)+dtop*direction(2);
    
    if xtop^2+ytop^2>radius^2
        dtop=inf;
    end
    
    dbot=getDistanceToPlane(position,direction,bottom);
    xbot= position(1)+dbot*direction(1);
    ybot= position(2)+dbot*direction(2);
    
    if xbot^2+ybot^2>radius^2
        dbot=inf;
    end    
    
    d=min(dcyl,min(dtop,dbot));
end
    
end