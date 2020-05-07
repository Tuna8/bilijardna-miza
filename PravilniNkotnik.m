function nkotnik = PravilniNkotnik(n, radij)
% function nkotnik = PravilniNkotnik(n)

% PravilniNkotnik vrne seznam točk, ki predstavljajo ogljišča pravilnega n
% kotnika, ki leži včrtan kročnici z radijem $radij$. (Ogljišča ležijo na 
% krožnici, ki ima središče v (0, 0))

%

% vhodni podatki:

% n, kjer je n naravno število večje ali enako 3. Za število n izberemo
% tisto, ki nam pove koliko kotov naj ima naš n kotnik. 
% radij, kjer je pozitivno realno število, ki predstavlja koliko naj bo
% radij krožnice v katerem leži naš večkotnik

%

% izhodni podatki:

% nkotnik je matrika 2xn, ki predstavlja točke n-kotnika

sezTock= zeros(2,n);
alpha = 2*pi/n;
phi2 = alpha/2 +pi/2; 
for i = 1:n
    xi = radij*cos(alpha*(i-1)-phi2); 
    yi = radij*sin(alpha*(i-1)-phi2);
    sezTock(:,i) = [xi;yi];
end
nkotnik = sezTock';
end
