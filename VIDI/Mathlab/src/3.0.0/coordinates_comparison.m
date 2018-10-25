%funzione che stima la differenza tra le coordinate attese per i target e
%quelle misurate all'istante corrente. In ingresso: coordinate attese,
%coordinate stimate, dimensioni della maschera lungo x e lungo y. In
%uscita, un segnale di controllo del tipo vero/falso per la funzione
%chiamante.
function[out1]=coordinates_comparison(tollerance_comparison,coor1,coor2,size_mask_1,size_mask_2)
%calcolo della differenza tra le coordinate attese e stimate
difx=abs(coor1(1,1)-coor2(1,1));
dify=abs(coor1(1,2)-coor2(1,2));
% Attenzione:
% Tolleranza sulla differenza fra coordinate delle maschere di riferimento
% e quelle sull'immagine corrente
%if difx<=(size_mask_1*tollerance_comparison) && dify<=(size_mask_2*tollerance_comparison)
if difx<=((size_mask_1/2)+tollerance_comparison) && dify<=((size_mask_2/2)+tollerance_comparison)
%if difx<=((size_mask_1/2)+1) && dify<=((size_mask_2/2)+1)%introduco una tolleranza:
    %se le differenze sono minori del 50% delle dimensioni delle maschere
    %(piccoli spostamenti della telecamera)
    out1=1;
else
    out1=-1;
end