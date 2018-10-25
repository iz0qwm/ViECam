%calcolo dei coefficienti di correlazione. Nell'ordine, gli ingressi sono:
%la cartella di lavoro, la lista immagini, le intensità medie delle
%immagini, il numero di righe, il numero di colonne, il numero di immagini
%analizzate nel calcolo delle intensità medie
function[Pear] = calcolo_coefficienti_pearson(cartella,lista,medie_int,r,c,immagini_analizzate)
W=zeros(immagini_analizzate,c+1);
W(:,1)=medie_int(1:immagini_analizzate,1);
Pear=zeros(r,c);
for k=1:r %numero righe
    for i=1:immagini_analizzate 
        %Trasforma in grigio ogni immagine di cui calcolare Pearson e ne
        %trova gli edge
        %L'immagine di pearson è quindi una media degli edge di tutte le
        %immagini
        imm_t=rgb2gray(imread(strcat(cartella,lista(i).name)));
        %imm_t=edge(rgb2gray(imread(strcat(cartella,lista(i).name))),'roberts',0.02);
        W(i,2:c+1)= imm_t(k,:);%prende la colonna in esame e la scrive nella matrice W replicandola su tutte le righe
        clear imm_t
    end
        coef = corrcoef(W); %calcola il coefficiente di correlazione tra i pixel della riga in esame e l'intensità media al variare di t;
        %i valori che ci interessano sono quelli della prima riga o colonna (la matrice è simmetrica)
        Pear(k,1:c)= coef(1,2:end);%scrive riga per riga la matrice a righe complete
        %pongo a zero tutti gli elementi tranne la prima colonna che rimane
        %quella delle intensità medie
        clear coef W
        W=zeros(immagini_analizzate,c+1);
        W(:,1)=medie_int(1:immagini_analizzate,1);
end
            