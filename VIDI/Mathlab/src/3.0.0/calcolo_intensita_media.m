%calcolo dell'intensità media dei pixel.
function[Mean] = calcolo_intensita_media(image)
        R = mean(image,1);%media sulle righe
        Mean = mean(R);%media sui valori trovati sopra
