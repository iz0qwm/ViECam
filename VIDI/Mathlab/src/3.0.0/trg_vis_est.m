%funzione per il calcolo della visibilità di ciascun target. In ingresso,
%la maschera relativa al target, le sue coordinate, l'immagine corrente, il
%massimo di cross-correlazione finora ottenuto (corrispondente al massimo
%di visibilità finora misurato). In uscita, visibilità del target in esame,
%il massimo di cross-correlazione e il valore corrente di
%cross-correlazione.
function [visibility new_max_xcorr xcorr_t]=trg_vis_est(tollerance_comparison,mask,coord,imm_t,old_max_xcorr)
%tic
posizione=([coord(1,1) coord(1,3);coord(1,2) coord(1,4)]);
%determino se il target è stato individuato nella posizione in cui mi aspetto di trovarlo
[position xcorr_t]=coordinate_trgts_in_new_imm(tollerance_comparison,imm_t,mask{1},posizione);

%if xcorr_t>old_max_xcorr
    new_max_xcorr=xcorr_t; %se il valore corrente di cross-correlazione è superiore al massimo calcolato
%                           %fino a questo momento, diventa il nuovo massimo
%else
%    new_max_xcorr=old_max_xcorr; %altrimenti il massimo resta invariato
%end

visibility=-1;%inizializzo a -1 la visibilità così se in uscita trovo questo valore mi accorgo che c'è qualche problema
              %e il target non è stato trovato
if xcorr_t<=0
    return
end

if position(1)==(-1)
    disp(strcat('Target_1 found in a new position. Please check the image."'));
else
    %visibility=mask{2}*xcorr_t/new_max_xcorr; %la visibilità è calcolata rispetto 
                                              %al massimo di cross-correlazione
                                              %(e quindi di visibilità)
                                              %finora trovato
    visibility=mask{2}*xcorr_t;
end
%toc