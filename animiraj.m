function animiraj(k_odbojev, n_kotov, premerKroglice, radijKroga)
%function animiraj(k_odbojev, n_kotov, radijKroglice, radijKroga)
% Funkcija animiraj nariše biljardno mizo in obrobo biljardne mize
% določi navidezni n-kotnik, od katerega se odbija kroglica, izpisuje do
% koliko odbojev je že prišlo, določi kje se točka nahaja na začetku,
% določi smer do prvega odboja, določi kje se bo točka odbila, izračuna
% smer po prvemu odboju in animira premike kroglice.
%
% vhodni podatki:
% (k_odbojev, n_kotov, premerKroglice, radijKroga) k_odbojev je naravno
% število, koliko odbojev bi radi videli, n_kotov je prav tako naravno
% število, ki predstavlja število ogljišč, ki jih ima bilijardna miza,
% premerKroglice je pozitivno število, ki predstavlja premer bilijardne
% kroglice, radijKroga, pa je pozitivno število, ki naj bo radij očrtane
% krožnice danega n-kotnika (in večje od radija kroglice)
%
%Funkcija nima izhodnih podatkov

%preverimo, ali so vhodni podatki smiselni. 
while or(k_odbojev<=0, ~ismember(class(k_odbojev), ['double']))
    fprintf('%i ni naravno število, število odbojev mora biti pozitivno naravno število \n', k_odbojev)
    k_odbojev= input('Vpišite število odbojev (večje od 0): ');
end

while or( n_kotov<=2, ~ismember(class(n_kotov), ['double']))
    fprintf('%i ni naravno število večje ali enako 3, število kotov mora biti naravno in večje od 3  \n', n_kotov)
    n_kotov= input('Vpišite število kotov (večje ali enako 3): ');
end

while or( premerKroglice<=0, ~ismember(class(premerKroglice), ['double']))
    fprintf('%i ni pozitivno število, premer kroglice mora biti pozitivno število \n', premerKroglice)
    premerKroglice= input('Vpišite premer kroglice (večje od 0): ');
end

while or( radijKroga<premerKroglice, ~ismember(class(radijKroga), ['double']))
    fprintf('%i ni večje od radija kroglice. Radij kroga mora biti večji od premera kroglice \n', radijKroga)
    radijKroga= input('Vpišite radij kroga (večje od radija kroglice): ');
end


skupno_odbojev = k_odbojev;
%določimo biljardno mizo
ogljisca_mize = PravilniNkotnik(n_kotov, radijKroga);

%določimo n kotnik, od katerega se bo odbijalo središče krglice
notranji_kot = (n_kotov-2)*pi/n_kotov;
razlika_kroznic = (premerKroglice/sin(notranji_kot/2))/2;
ogljisca_odboja= PravilniNkotnik(n_kotov, radijKroga - razlika_kroznic);

%za vizualno lepšo sliko narišemo ograjco biliardne mize
rob = radijKroga + radijKroga*0.2;
obroba = PravilniNkotnik(n_kotov, rob);
ograda = polyshape({obroba(:,1),ogljisca_mize(:,1)}, {obroba(:,2),ogljisca_mize(:,2)});
plot(ograda, 'FaceColor',[0.4 0.2 0.1], 'FaceAlpha',1);
tekst = text(-rob,rob,'k = ' + string(skupno_odbojev-k_odbojev));
axis equal
hold on

%naredimo biliardno mizo polyshape tipa
biljardnaMiza = polyshape(ogljisca_odboja(:,1),ogljisca_odboja(:,2));
fill(ogljisca_mize(:,1),ogljisca_mize(:,2),  [0 0.4 0])
hold on

%določimo random tocko na bilijardni mizi
[zogica, toc1, toc2] = randTockaPravilniNKotnik(ogljisca_odboja);

%upoštevamo radij kroglice
phi = 0:0.01:2*pi;
x_krog = zogica(1) + premerKroglice*cos(phi)/2;
y_krog = zogica(2) + premerKroglice*sin(phi)/2;

izris = fill(x_krog,y_krog,'r');

%dolocimo smer do prvega odboja
smer = smerDoPrvegaOdboja(zogica,toc1,toc2);

%dolocimo tocko drugega odboja
[odboj,ogljisce1,ogljisce2] = Presecisce(zogica,smer, ogljisca_odboja,radijKroga);

%premikamo točko do točka odboja
PremikanjeVNkotniku(zogica,biljardnaMiza,smer, izris, premerKroglice, radijKroga)

%izračunamo smer po prvem odboju
smer2 = SmerPoOdboju(smer,ogljisce1,ogljisce2);
k_odbojev = k_odbojev-1;
tekst.String = 'k = ' + string(skupno_odbojev-k_odbojev);
zogica = odboj;
smer = smer2;

%postopek ponavljamo dokler se ne zgodi k odbojev
while k_odbojev
    PremikanjeVNkotniku(zogica,biljardnaMiza,smer,izris, premerKroglice, radijKroga)
    [P_odboj, ogljisce1, ogljisce2] = Presecisce(zogica, smer, ogljisca_odboja, radijKroga);
    smerPoOdboju = SmerPoOdboju(smer, ogljisce1, ogljisce2);
    zogica = P_odboj;
    smer = smerPoOdboju;
    k_odbojev = k_odbojev-1;
    tekst.String = 'k = ' + string(skupno_odbojev-k_odbojev);
end
PremikanjeVNkotniku(zogica,biljardnaMiza,smer,izris, premerKroglice, radijKroga)
end