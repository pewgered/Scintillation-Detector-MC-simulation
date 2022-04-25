function [ detectorEnergy ] = getDetectorEnergy(radius, heigth, rSource, sourceEnergy, FWHM, CSTab)

detectorEnergy=0;

sourceDirection=getDirectionFromSource(radius, heigth, rSource);

distanceToCylinder=getDistanceToCylinderFromOutside(rSource, sourceDirection, heigth/2, -heigth/2, radius);

if distanceToCylinder==inf
    return
end

currentPosition=rSource+sourceDirection*distanceToCylinder;

absorbedEnergy=getAbsorbedEnergy(radius,heigth,currentPosition,sourceDirection,sourceEnergy,CSTab);

if absorbedEnergy>0
    detectorEnergy=abs(absorbedEnergy+FWHM*randn());
end

end

