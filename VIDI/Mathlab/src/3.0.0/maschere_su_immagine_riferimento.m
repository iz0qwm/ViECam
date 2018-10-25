%funzione che riceve in ingresso l'immagine di riferimento e le coordinate
%in corrispondenza delle quali ritagliare tale immagine per ricavarne le
%maschere
function[maschera]=maschere_su_immagine_riferimento(im_rif,c1)
maschera=im_rif(c1(1,1):c1(1,2),c1(1,3):c1(1,4));
%disp(maschera);
%maschera=im_rif(c1(1,1):c1(1,2),c1(1,3));