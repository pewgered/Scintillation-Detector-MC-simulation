function [efficiency] = feladat1()
%legalább 1000000 -t értdemes beadni neki

figure(1)
nValues=1e6;
R=3;
h=5;
S=[4,4,0];
E_gamma=1.3325;
rho_NaI=3.67;
E_FWHM=0.008;
[efficiency,spectrum,escapedEnergyRatio]=simulateDetector(nValues,R,h,S,E_gamma,rho_NaI,E_FWHM);

xlabel('Energy (MeV)')
ylabel('Counts per Channel')
title('0,662 keV-es gammaforrás spektruma')
escapedEnergyRatio

dlmwrite('gammaSpectrum662keV.txt',spectrum);

end