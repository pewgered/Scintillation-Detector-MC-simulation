function [efficiency,Counts,escapedEnergyRatio] = simulateDetector(nValues, radius, heigth, rSource, sourceEnergy, density, FWHM)
tic
%bemeneten: radius(cm),height(cm),sourceEnergy(MeV),density(g/cm^3),FWHM(MeV)


CSTab=[dlmread('crossSection.txt')];
CSTab=[CSTab(:,1),CSTab(:,2:end)*density];

totalAbsorbedEnergy=0;

%beütések
Counts=zeros(1024,1);
%csatornák energiái
Channels=linspace(0,1.1*sourceEnergy,1024);


for j=1:nValues
    
    detectorEnergy=getDetectorEnergy(radius,heigth,rSource,sourceEnergy,FWHM,CSTab);
    
    totalAbsorbedEnergy=totalAbsorbedEnergy+detectorEnergy;
    
    i=1;
    right=1024;
    while i+1<right
        mid=ceil((i+right)/2);
       if detectorEnergy<Channels(mid)
           right=mid;
       else
           i=mid;
       end
    end
    
    Counts(i)=Counts(i)+1;
    
    
%enélkül gyorsabban fut
%     if mod(i,100)==0
%        semilogy(Channels,Counts,'.')
%        pause(0.0001)
%     end
    
    
end



rSphere=sqrt(radius^2+(heigth/2)^2);
rSourceDistance=sqrt(rSource(1)^2+rSource(2)^2+rSource(3)^2);
phi=asin(rSphere/rSourceDistance);
efficiency=totalAbsorbedEnergy/(nValues*sourceEnergy);
if(rSourceDistance>radius)
    efficiency=efficiency*(1-cos(phi))/2;
end

escapedEnergyRatio=totalAbsorbedEnergy/(nValues*sourceEnergy);


semilogy(Channels,Counts,'.')

toc
end

