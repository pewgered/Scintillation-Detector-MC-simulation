function[scatteringAngle, outEnergy] = getScatteringAngle(inEnergy)

alpha=inEnergy/0.511;
lambda=1/alpha;
xi=(1+2*alpha)/(9+2*alpha);

r3=1;
delta=0;

while r3>delta
    r1=rand();
    r2=rand();
    r3=rand();
    
    if r1<=xi
        mu=1+2*r2*alpha;
        delta=4*(1/mu-1/mu^2);
    else
        mu=(1+2*alpha)/(1+2*r2*alpha);
        delta=((1+lambda-lambda*mu)^2+1/mu)/2;
    end
end

scatteringAngle=acos(1-lambda*(mu-1));
outEnergy=inEnergy/mu;

end