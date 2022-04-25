function [crossSection] = getCrossSection(Energy,CSTab)
%Bemeneti energia MeV-ben
%a függvény kimenete 3 hatáskeresztmetszet Energy bemeneti energia esetén
%rendre: Compton-szórás, Fotoeff., Párkeltés
% két érték között lineárisan interpolál a függvény

i=1;
right=size(CSTab,1);
while i+1<right
    mid=ceil((i+right)/2);
   if Energy<CSTab(mid)
       right=mid;
   else
       i=mid;
   end
end
i
if Energy==CSTab(i,1)
    v=CSTab(i,:);
else
    slope=(CSTab(i+1,:)-CSTab(i,:))/(CSTab(i+1,1)-CSTab(i,1));
    v=CSTab(i,:)+(Energy-CSTab(i,1))*slope;
end

crossSection=[v(2:3),v(4)+v(5)];

end

