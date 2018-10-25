function[max_rel_p]=trova_max_rel(avg_t,avg_p,finestra,num_minimo_campioni)
max_rel_p=-1*ones(size(avg_t));

i=1;
while (avg_t(i)<=avg_t(end) && (avg_t(i)-avg_t(1))<finestra)
    i=i+1;
end
j=0;
t_t=avg_t(i);
while i<=length(avg_t)
    t_t=avg_t(i);
    indici = find((avg_t>=t_t-finestra) & (avg_t<=t_t));
    t_w=avg_t(indici);
    pwr_w = avg_p(indici);
    if length(indici)>num_minimo_campioni
        max_rel_p(i)=max(pwr_w);
    end
    i=i+1;
    if(mod(j,100)==0)
    (t_t-avg_t(1))/(avg_t(end)-avg_t(1))
    end
end
