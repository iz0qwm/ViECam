function[t_sample p_avg_w]=avg_finestra(t_w,pwr_w,soglia_campioni)
t_sample=-2;
p_avg_w=-2;
if length(t_w)>=soglia_campioni
    t_sample=-1;
    p_avg_w=-1;
    delta_t_medio=mean((t_w(2:end)-t_w(1:end-1))*60*60*24);
    delta_t_sigma=std((t_w(2:end)-t_w(1:end-1))*60*60*24);
    if delta_t_sigma/delta_t_medio <(sqrt(1/3))
        p_avg_w=mean(pwr_w);
        t_sample=t_w(end);
    end
end
end