function [d] = getDistanceToPlane(position, direction , height)
%([0,0,0],[0,0,1],1)
%([0,0,0],[1,0,0],1)
%([0,0,0],[1,0,0],-1)

if direction(3)==0
    d=inf;
else
    d=(height-position(3))/direction(3);
end

end