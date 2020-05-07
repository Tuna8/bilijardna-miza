function [presecisce, A, B] = Presecisce(tocka, smer, veckotnik,radij)
% function  [presecisce, A, B] = Presecisce(tocka, smer, veckotnik,radij)
% Presecisce izračuna, kje se bo kroglica
% odbila po prvem odboju. Vrne točko odboja in oglišča stranice, kjer bo
% prišlo do odboja.
%
% vhodni podatki:
% tocka, smer, veckotnik,radij) kjer tocka [x y] predstavlja pozicijo točke
% ki se premika v večkotniku, smer predstavlja vektor [s_x s_y] v katero smer
% se točka giblje. Večkotnik je matrika [nx2], v kateri so spravljeni
% podatki o ogliščih n-kotnika, Radij, pa je skalar, ki nam pove radij
% očrtane krožnice danega n-kotnika
%
% izhodni podatki:
% [presecisce, A, B] Presečišče je točka [x y], ki nam predstavlja točko
% odboja. A = [x_1 y_1] in B = [x_2 y_2] ki določata stranico odboja.

tockazunaj = tocka + (3*radij*smer);
tocka = tocka + 10e-6*smer; % premaknimo se iz roba, da ne dobimo dveh presešičš
x2 = [ tockazunaj(1) tocka(1)]; % x koordinata daljice točke in točke zunaj veckotnika
y2 = [tockazunaj(2) tocka(2)];% y koordinata daljice točke in točke zunaj veckotnika
x = [veckotnik(:,1); veckotnik(1,1)'];%ogljisca n kotnika + prvo ogljisce (x koordinata)
y = [veckotnik(:,2); veckotnik(1,2)'];%ogljisca n kotnika + prvo ogljisce (y koordinata)

[xi,yi, li] = polyxpoly(x,y, x2,y2); %xi, yi presečišče z poligonom, li indeks ogljišča
presecisce = [xi yi]';
A = [x(li(1)), y(li(1))];
B = [x(li(1)+1), y(li(1)+1)];
end