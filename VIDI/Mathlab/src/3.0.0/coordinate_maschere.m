%funzione che determina la coordinate delle maschere. In ingresso: immagine
%di riferimento e quella del target selezionato. In uscita: coordinate del
%target selezionato.
function[P]=coordinate_maschere(image,target)
P=zeros(2,2); %P contiene le coordinate del vertice in basso a sinistra e in 
              %in alto a destra del rettangolo che racchiude i target
%cor=xcorr2(double(image),double(target));%cerca i target con la cross-correlazione
%
%There is a subtle difference between normxcorr2 and xcorr2 in their function call syntaxes. 
%For normxcorr2(A,B), the function slides A through B. Therefore, normxcorr2(Template,Image) 
%means that it looks for the match of Template in Image. For xcorr2(A,B), the function 
%actually slides B through A. Therefore, to achieve the similar functionality as in normxcorr2, 
%it has to be invoked in the form of xcorr2(Image, Template). Unlike normxcorr2 though, xcorr2 
%does not require the size of B to be larger than size of A, so you may not notice it at all but the result becomes unexpected.
%
cor=normxcorr2(double(target),double(image));%cerca i target con la cross-correlazione
 
corr=cor/max(max(cor));%normalizzo rispetto al massimo

[x y]=find(corr==1);%trova il punto in cui la cross-correlazione è massima
coord=([x y]);
minx=(find(coord(:,1)==min(coord(:,1))));
x1=min(coord(minx,1));
maxy=(find(coord(:,2)==max(coord(:,2))));
y1=max(coord(maxy,2));
P(1,1)=x1-size(target,1)+1;
P(1,2)=y1-size(target,2)+1;
P(2,1)=x1;
P(2,2)=y1;
%disp(P)
clear x1 y1 mas ma imag coord thi the minx maxy x y Q a