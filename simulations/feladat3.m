function [] = feladat3(nValues)
%c�lszer� legal�bb 100000 -et adni neki

nPoints=10;

efficiencyValues=zeros(1,nPoints);
energyValues=linspace(0.4,2.4,nPoints);

for i=1:nPoints
    figure(i)
    efficiencyValues(i)=simulateDetector(nValues,2.5,3,[3,-3,2],energyValues(i),3.67,0.006);
    xlabel('Energy (MeV)')
    ylabel('Counts per Channel')
end

figure(nPoints+1)
plot(energyValues,efficiencyValues)
xlabel('energy (Mev)')
ylabel('efficiency')
title('A hat�sfok v�ltoz�sa 0.4-2.4 MeV forr�senergia eset�n')
end