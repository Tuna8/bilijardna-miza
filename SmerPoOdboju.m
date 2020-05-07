function smer2 = SmerPoOdboju(smer, A, B)
% function  smer2 = SmerPoOdboju(smer, A, B)
%  SmerPoOdboju izračuna, v katero smer se bo kroglica premikala po odboju
%
% vhodni podatki:
% (smer, A, B) smer predstavlja vektor [s1 s2] v katero smer
% se točka giblje. A = [x_1 y_1] in B = [x_2 y_2] sta točki,
% ki določata stranico odboja.
%
% izhodni podatki:
% smer2 je vektor [s2_x s2_y], ki predstavla smer po odboju


smernormale = [-B(2)+A(2), B(1)-A(1)]; % smer normale 
normala = smernormale/norm(smernormale); % normiramo
smer2 = smer - 2*dot(normala,smer)*normala'; 

end