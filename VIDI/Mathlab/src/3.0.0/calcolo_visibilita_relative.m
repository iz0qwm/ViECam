%funzione per il calcolo delle visibilità relative. In ingresso: valore di
%cross-correlazione corrente del target in esame, il massimo di
%cross-correlazione finora trovato, la distanza relativa associata al
%target. In uscita: visibilità relativa del target.
function[rel_visibility]=calcolo_visibilita_relative(xcorr_t,new_max_xcorr,dist_rel)
if new_max_xcorr==0
    rel_visibility=0;
else
    if xcorr_t>0
    rel_visibility=dist_rel*xcorr_t/new_max_xcorr;
    else
        rel_visibility=0;
    end
end
