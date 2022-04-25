function [freePath] = getFreePath(totalCrossSection)
%1-rand-ot irtam a log argumentumába, hogy a 0-ba ne legyen vegtelen

freePath=-1/totalCrossSection*log(1-rand());

end

