function [absorbedEnergy] = getAbsorbedEnergy(radius,heigth,currentPosition,direction,energy,CSTab)

CS=getCrossSection(energy,CSTab);
absorbedEnergy=0;

transition=getFreePath(sum(CS));
currentPosition=currentPosition+direction.*transition;


if (currentPosition(3)>(-heigth/2)&&currentPosition(3)<(heigth/2)&&(currentPosition(1)^2+currentPosition(2)^2)<radius^2)

    pScatter=CS(1)/sum(CS);
    pAbsorption=CS(2)/sum(CS);
    r=rand();
        
    if r<pScatter
        [scatteringDirection,newEnergy]=getScatteringDirection(energy);
            
        absorbedEnergy=absorbedEnergy+(energy-newEnergy);
        direction=[transformDirection(scatteringDirection,direction)]';
        absorbedEnergy=absorbedEnergy+getAbsorbedEnergy(radius,heigth,currentPosition,direction,newEnergy,CSTab);
            
    elseif r<pScatter+pAbsorption
        absorbedEnergy=energy;

    else
        direction=getIsotropicDirection();
        absorbedEnergy=absorbedEnergy+energy-1.022;
        absorbedEnergy=absorbedEnergy+getAbsorbedEnergy(radius,heigth,currentPosition,direction,0.511,CSTab);
        absorbedEnergy=absorbedEnergy+getAbsorbedEnergy(radius,heigth,currentPosition,-direction,0.511,CSTab);
            
    end
end
end

