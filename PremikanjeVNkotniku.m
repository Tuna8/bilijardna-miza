function PremikanjeVNkotniku(tocka, veckotnik, smer, risba, premer_zogice, radijKroga)
% function PremikanjeVNkotniku(tocka, veckotnik, smer, risba, radij)
% PremikanjeVNkotniku na platnu risba grafično premika točko v dani smeri s
% konstantno hitrostjo a le do roba večkotnika.
%
% vhodni podatki:
% (tocka, veckotnik, smer, risba, premer_zogice, radijKroga), kjer tocka predstavlja tocko [x y] ki
% jo bomo premikali. Večkotnik je objekt tipa polyshape, v katerem se točka
% premika. smer je vektor [s_x s_y] v katero smer se tocka giblje
% Risba je objekt tipa plot, na katerem točko premikamo. premer_zogice je
% skalar, ki predstavlja radij kroglice, ki jo pomikamo po večkotniku. 
% Radij kroga, pa radij očrtane krožnice n-kotnika
%
% izhodni podatki:
% funkcija nič ne vrača
tocka1 = tocka;
tocka2 = tocka;
while isinterior(veckotnik, tocka2')
    tocka3= tocka2 + (radijKroga/premer_zogice *6e-3)*smer; %premaknemo točko za nek korak
    %naredimo krogec okoli točke
    phi = 0:0.01:2*pi;
    tocka1 = tocka2 + [premer_zogice*cos(phi)/2; premer_zogice*sin(phi)/2]; 
    %posodobimo podatke
    tocka2 = tocka3;
    set(risba,'XData',tocka1(1,:), 'YData', tocka1(2,:));
    pause(0.01)
end   
end