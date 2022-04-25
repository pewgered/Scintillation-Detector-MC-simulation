function [] = feladat4(nValues)
%célszerû legalább 100000 -et adni neki

nPoints=10;

densityValues=linspace(0.01,3.67,nPoints);

for i=1:nPoints
    figure(i)
    [efficiencyValues(i),chanels]=simulateDetector(nValues,2.5,3,[3,-3,2],2.4,densityValues(i),0.006);
    fullEnergy(i)=max(chanels(900:1000)); %Teljes energia csúcs ezekben a csatornákban lesz
    singleEscape(i)=max(chanels(700:800));%Elsõ kiszökési csúcs ezekben a csatornákban lesz
    doubleEscape(i)=max(chanels(500:600));%Második kiszökési csúcs ezekben a csatornákban lesz
    xlabel('Energy (MeV)')
    ylabel('Counts per Channel')

end

figure(nPoints+1)
plot(densityValues,singleEscape./fullEnergy, densityValues,doubleEscape./fullEnergy)
legend('Elsõ Kiszökés/Teljes Energia','Második Kiszökés/Teljes Energia')
xlabel('density (g/cm^3)')

end