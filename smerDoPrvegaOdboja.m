function smer = smerDoPrvegaOdboja(tocka, ogljisce1, ogljisce2)
% function  smer = smerDoPrvegaOdboja(tocka, ogljisce1, ogljisce2)
% smerDoPrvegaOdboja vrne vektor, ki kaže v smeri premikanja točke do
% prvega odboja. Smer premikanja je od točke do razpolovišča stranice, ki
% jo opisujeta ogljisce1 in ogljisce2
%
% vhodni podatki:
% (tocka, ogljisce1, ogljisce2), kjer tocka = [x y] predstavlja tocko katere nas
% zanima smer gibanja. Ogljisce1 = [x_1 y_1] in ogljisce2 = [x_1 y_1]
% predstavljata stranico proti
% kateri se točka premika
%
% izhodni podatki:
% smer je normiran vektor [s_x s_y] v smeri katerega se točka premika (kaže od točke do
% razpolovišča stranice)

razpolovisce = (ogljisce1 + ogljisce2) /2; %izračunamo razpolovišče
vek = (razpolovisce - tocka); %smer premikanja
smer = vek/norm(vek); % to smer še normiramo
end