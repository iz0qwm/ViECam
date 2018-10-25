function[V]=visibility_hautiere(cartella,contrasto_medio,dist_trgts)
file_cache=strcat(cartella,'data/visibility_hautiere.mat');
if size(dir(file_cache),1)==0
    D=max(dist_trgts);
    %c = mean_contrast(:,2);
   % contrasto_medio_pos=contrasto_medio(find(contrasto_medio>0));
    %c = mean_contrast(:,2);
   % c = contrasto_medio_pos/max(contrasto_medio_pos);
    c = contrasto_medio/max(contrasto_medio);
    sol = zeros(length(c),1);
    for i=1:length(c)
        sol(i) = lambertw(exp(-1/c(i))/c(i));
    end
    V = zeros(length(c),1);
    for i=1:length(c)
        V(i)=(3*c(i)*(D))/(1+c(i)*sol(i));
    end
else
    load(file_cache)
end
    save (file_cache, 'contrasto_medio', 'V')