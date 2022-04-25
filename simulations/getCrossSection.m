function [crossSection] = getCrossSection(Energy,CSTab)
%Bemeneti energia MeV-ben
%a f�ggv�ny kimenete 3 hat�skeresztmetszet Energy bemeneti energia eset�n
%rendre: Compton-sz�r�s, Fotoeff., P�rkelt�s
% k�t �rt�k k�z�tt line�risan interpol�l a f�ggv�ny

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

