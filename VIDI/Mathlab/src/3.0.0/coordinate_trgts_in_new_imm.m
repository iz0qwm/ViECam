%funzione per il calcolo delle coordinate dei target nell'immagine
%corrente. In ingresso: immagine corrente, maschera relativa al target e
%sue coordinate. In uscita: posizione trovata per il target e valore della
%cross-correlazione tra l'immagine corrente e la maschera
function[P correlazione_target]=coordinate_trgts_in_new_imm(tollerance_comparison,imm_t,mask,posizione)
P=zeros(2,2);
%cor=xcorr2(double(imm_t),double(mask));%matrice risultante dal calcolo della cross-correlazione
%
%There is a subtle difference between normxcorr2 and xcorr2 in their function call syntaxes. 
%For normxcorr2(A,B), the function slides A through B. Therefore, normxcorr2(Template,Image) 
%means that it looks for the match of Template in Image. For xcorr2(A,B), the function 
%actually slides B through A. Therefore, to achieve the similar functionality as in normxcorr2, 
%it has to be invoked in the form of xcorr2(Image, Template). Unlike normxcorr2 though, xcorr2 
%does not require the size of B to be larger than size of A, so you may not notice it at all but the result becomes unexpected.
%
cor=normxcorr2(double(mask),double(imm_t));%matrice risultante dal calcolo della cross-correlazione

corr=cor/max(max(cor));%normalizzo rispetto al massimo dei valori trovati
[x y]=find(corr==1);%cerco il punto in cui ho il valore massimo
coord=([x y]);

minx=(find(coord(:,1)==min(coord(:,1))));
x1=min(coord(minx,1));
maxy=(find(coord(:,2)==max(coord(:,2))));
y1=max(coord(maxy,2));
P(1,1)=x1-size(mask,1)+1;
P(1,2)=y1-size(mask,2)+1;
P(2,1)=x1;
P(2,2)=y1;
%disp(P)



dim_mask_1=size(mask,1);
dim_mask_2=size(mask,2);
if size(coord,1)==1 %se il punto trovato è unico
        P(1,1) = coord(1,1)-dim_mask_1+1; %definisco le coordinate dell'area in cui ho trovato il valore massimo 
        P(1,2) = coord(1,2)-dim_mask_2+1;
        P(2,1) = coord(1,1);
        P(2,2) = coord(1,2);
        u1 = coordinates_comparison(tollerance_comparison,P,posizione,dim_mask_1,dim_mask_2);
        %verifico che le coordinate trovate siano le stesse di quelle della
        %maschera, cioè quelle in cui mi aspetterei di trovare il target.
        %Attenzione:
        %vedi la funzione coordinates_comparison per la tolleranza
        if u1 == 1
            correlazione_target=max(max(cor));%se le coordinate sono esatte, il valore di cross-correlazione trovato è riportato in uscita
        else
            correlazione_target=-1;%altrimenti in uscita ho un valore che segnala un errore
        end
        
end

if size(coord,1)>1%se trovo più punti per il valore massimo di cross-correlazione, ripeto l'operazione precedente per 
    %ogni punto trovato, alla ricerca di quello che effettivamente
    %corrisponde alle coordinate esatte
    for j=1:size(coord,1)
        P(1,1)= coord(j,1)-dim_mask_1+1;
        P(1,2)= coord(j,2)-dim_mask_2+1;
        P(2,1)= coord(j,1);
        P(2,2)= coord(j,2);
        u1=coordinates_comparison(tollerance_comparison,P,posizione,dim_mask_1,dim_mask_2);
        if u1 == 1
            correlazione_target=max(max(cor));
        else
            correlazione_target=-1;
        end
        
    end
end
%se non viene trovato nulla, restituisce un valore che segnala un errore
if size(coord,1)==0
correlazione_target=-1;
end