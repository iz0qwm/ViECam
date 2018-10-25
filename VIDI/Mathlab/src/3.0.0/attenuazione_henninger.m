% Ae[dB/km] =17*(0.55/lam[um])^q/V[km]
% q=0.585*V^(1/3)
%funzione che calcola l'attenuazione equivalente. Acquisisce i
%valori di visibilità e la lunghezza d'onda, quindi
%calcola l'esponente q e infine l'attenuazione equivalente

function[Ae]=attenuazione_henninger(visibility)
lam=sqrt(0.7^2+0.54^2+0.4^2);
if (visibility<=0)
    Ae=-1;
else
q=0.585*((visibility/1000)^(1/3));
Ae=(17*((0.55/lam)^q)/(visibility/1000));
end