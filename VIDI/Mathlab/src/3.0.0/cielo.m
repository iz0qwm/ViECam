%
%
carica_config_sito
%
% Cielo di riferimento
%
% Utilizzare questo script per ritagliare le coordinate del solo cielo
%
im_rif_col = imread('C:\VIDI\DATA\current.jpg'); 
figure(); 
imshow(im_rif_col); 
figure(); 
% rect = [x_vertice, y_vertice, larghezza, altezza]  
rect = [470 630 230 80]; 
im_cielo = imcrop(im_rif_col, rect); 
imshow(im_cielo); 

