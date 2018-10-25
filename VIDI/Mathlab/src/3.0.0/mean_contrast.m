%funzione per il calcolo del contrasto medio. In ingresso riceve la nuova
%immagine scattata all'istante t e i coefficienti di correlazione tra i
%pixel dell'immagine e l'intensità media al variare del tempo. In uscita,
%restituisce il contrasto medio secondo la stima descritta nell'articolo di
%Hautiere, cioè il modulo del gradiente pesato sui coefficienti di
%correlazione
function[contrasto_medio]=mean_contrast(image_t,pearson)
if size(image_t,1)==size(pearson,1)%eliminiamo le immagini acquisite con una risoluzione diversa (per esempio quelle scattate nei tentativi di cambio di risoluzione)
    gh = double(imfilter(image_t,fspecial('sobel') /8,'replicate'));%gradiente lungo le righe dell'immagine
    gv = double(imfilter(image_t,fspecial('sobel')'/8,'replicate'));%gradiente lungo le colonne
    mod = sqrt((gv.^2)+(gh.^2));
    modV = mod/255;%la somma euclidea dei gradienti è divisa per la luminanza di fondo, pari a 255 per la videocamera (v. articolo Hautiere)
    product = modV .* pearson;%moltiplichiamo ciascun elemento per il relativo coefficiente di correlazione
    contrasto_medio = sum(sum(product));
else
    contrasto_medio = 0;
end