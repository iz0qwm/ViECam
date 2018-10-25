%funzione che estrae i bordi dall'immagine a colori in ingresso
function[image_bordi]=RGB2EDGE(image)
k=rgb2gray(image);
%image_bordi=uint8(edge(k,'sobel'));
%image_bordi=edge(k,'sobel');
image_bordi=edge(k,'roberts',0.02);