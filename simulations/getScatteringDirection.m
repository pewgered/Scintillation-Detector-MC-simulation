function [direction, outEnergy] = getScatteringDirection(inEnergy)

direction=zeros(1,3);

[theta,outEnergy]=getScatteringAngle(inEnergy);

phi=2*pi*rand();
rho=sin(theta);

direction(1)=rho*cos(phi);
direction(2)=rho*sin(phi);
direction(3)=cos(theta);
end