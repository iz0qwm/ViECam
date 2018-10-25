function[avg_p avg_t]=finestra_media(tempo,pwr,finestra,shift,bias,num_campioni)
pwr=pwr-bias;
num_elementi=round(((tempo(end)-tempo(1))*60*60*24)/(shift*60*60*24));%calcolo il numero di istanti 
%temporali sul nuovo asse, dato dal rapporto tra il deltaT di partenza e la traslazione della finestra
avg_p=-1*ones(num_elementi,1);%inizializzo i vettori di uscita
avg_t=-1*ones(num_elementi,1);
i=1;
while (tempo(i)<=tempo(end) && (tempo(i)-tempo(1))<finestra)
    i=i+1;
end
j=0;
t_t=tempo(i);
while t_t<=tempo(end)
    indici = find((tempo>=t_t-finestra) & (tempo<=t_t));
    t_w=tempo(indici);
    pwr_w = pwr(indici);
    j=j+1;
    [avg_t(j) avg_p(j)]=avg_finestra(t_w,pwr_w,num_campioni);
    t_t=t_t+shift;
    if(mod(j,100)==0)
    (t_t-tempo(1))/(tempo(end)-tempo(1))
    end
end
% scarti=find(avg_t==-1 & avg_p==-1);
avg_t=(avg_t)';
avg_p=(avg_p)';
avg_p=avg_p(find(avg_t>(-1)));
avg_t=avg_t(find(avg_t>(-1)));