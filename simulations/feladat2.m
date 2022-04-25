function [efficiencyValues] = feladat2(nValues)
%legal�bb 100000 -et c�lszer� beadni neki

nPoints=10;

rPoints=[(linspace(1,-4,nPoints))',(linspace(4,-1,nPoints))',-2*ones(nPoints,1)];

efficiencyValues=zeros(1,nPoints);

for i=1:nPoints
    figure(i)
    efficiencyValues(i)=simulateDetector(nValues,2.5,3,rPoints(i,:),0.662,3.67,0.006);
    xlabel('Energy (MeV)')
    ylabel('Counts per Channel')
end

figure(nPoints+1)
x=linspace(1,nPoints,nPoints);
plot(x,efficiencyValues)
xlabel('position')
ylabel('efficiency')
title('A hat�sfok v�ltoz�sa az [1,4,-2] �s [-4,-1,-2] pontok k�z�tt')
end