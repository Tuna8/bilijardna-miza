function [tocka, ogljisce1 ,ogljisce2] = randTockaPravilniNKotnik(ogljisca)
% [tocka ,ogljisce1 ,ogljisce2] = randTockaPravilniNKotnik(ogljisca)
% randTockaPravilniNKotnik vrne seznam točk [tocka, ogljišče1, ogljišče2],
% kjer točka predstavlja random točko v trikotniku z ogljišči: ogljišče1,
% ogljišče2 in (0,0) 
%
% vhodni podatki:
% ogljišča:  matrika nx2 seznam točk, ki predstavljajo ogljišča pravilega n kotnika
%
% izhodni podatki:
% [tocka, ogljisce1 ,ogljisce2] točka predstavlja random točko [x,y]
% znotraj mnogokotnika, ogljisce1 = [x_1, y_1], ogljisce2 = [x_2, y_2] 
% pa sta ogljišči, ki z (0,0) tvorita trikotnik v katerem se tocka nahaja

%razdelimo nkotnik na trikotnike in random izberemo enega
randomTrikotnik = randi([1,length(ogljisca)],1,1); 
A = [0 0]; % A točka trikotnika
B = ogljisca(randomTrikotnik,:); %B točka trikotnika

% če smo izbrali zadnji trikotnik, moramo izbrati 1 ogljišče, da dobimo
% trikotnik
if randomTrikotnik == length(ogljisca) 
    C = ogljisca(1,:);
else
    %sicer izberemo naslednje ogljišče
    C = ogljisca(randomTrikotnik+1,:);
end

%formula za random točko znotraj trikotnika
r1 = rand();
r2 = rand();
tocka = ((1-sqrt(r1)).*A + (sqrt(r1)*(1-r2)).*B + (r2*sqrt(r1)).*C)';

%vrnemo ogljišča
ogljisce1 = B';
ogljisce2 = C';
end
