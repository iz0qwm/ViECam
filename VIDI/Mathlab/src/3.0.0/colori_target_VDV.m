    %
    % Script che serve per individuare i colori del cielo
    %
    carica_config_sito
    carica_algoritmi
    %
    disp('********************* Valori dei colori dei target  ********************')

    %
    % Questo è il rettangolo del target 4.
    % Ho utilizzato cielo.m per cercare le coordinate
    % rect = [x_vertice, y_vertice, larghezza, altezza]
    Coord_target4_x_vertice=single(coord_target4_x_vertice);
    Coord_target4_y_vertice=single(coord_target4_y_vertice);
    Coord_target4_larghezza=single(coord_target4_larghezza);
    Coord_target4_altezza=single(coord_target4_altezza);
    %
    rect_target4 = [Coord_target4_x_vertice Coord_target4_y_vertice Coord_target4_larghezza Coord_target4_altezza]; 
    %
    % Ritaglio il solo rettangolo del target4 e rimpicciolisco l'immagine per effettuare la ricerca dei pixel più
    % velocemente
    %
    im_target4_curr = imresize(imcrop(image, rect_target4),0.2); 
    %
    % Questo è il rettangolo del target 3.
    % Ho utilizzato cielo.m per cercare le coordinate
    % rect = [x_vertice, y_vertice, larghezza, altezza]
    Coord_target3_x_vertice=single(coord_target3_x_vertice);
    Coord_target3_y_vertice=single(coord_target3_y_vertice);
    Coord_target3_larghezza=single(coord_target3_larghezza);
    Coord_target3_altezza=single(coord_target3_altezza);
    %
    rect_target3 = [Coord_target3_x_vertice Coord_target3_y_vertice Coord_target3_larghezza Coord_target3_altezza];
    %
    % Ritaglio il solo rettangolo del target3 e rimpicciolisco l'immagine per effettuare la ricerca dei pixel più
    % velocemente
    %
    im_target3_curr = imresize(imcrop(image, rect_target3),0.2);
    %
    % Questo è il rettangolo del target 2.
    % Ho utilizzato cielo.m per cercare le coordinate
    % rect = [x_vertice, y_vertice, larghezza, altezza]
    Coord_target2_x_vertice=single(coord_target2_x_vertice);
    Coord_target2_y_vertice=single(coord_target2_y_vertice);
    Coord_target2_larghezza=single(coord_target2_larghezza);
    Coord_target2_altezza=single(coord_target2_altezza);
    %
    rect_target2 = [Coord_target2_x_vertice Coord_target2_y_vertice Coord_target2_larghezza Coord_target2_altezza];
    %
    % Ritaglio il solo rettangolo del target2 e rimpicciolisco l'immagine per effettuare la ricerca dei pixel più
    % velocemente
    %
    im_target2_curr = imresize(imcrop(image, rect_target2),0.2);
    %
    % Questo è il rettangolo del target 1.
    % Ho utilizzato cielo.m per cercare le coordinate
    % rect = [x_vertice, y_vertice, larghezza, altezza]
    Coord_target1_x_vertice=single(coord_target1_x_vertice);
    Coord_target1_y_vertice=single(coord_target1_y_vertice);
    Coord_target1_larghezza=single(coord_target1_larghezza);
    Coord_target1_altezza=single(coord_target1_altezza);
    %
    rect_target1 = [Coord_target1_x_vertice Coord_target1_y_vertice Coord_target1_larghezza Coord_target1_altezza];
    %
    % Ritaglio il solo rettangolo del target1 e rimpicciolisco l'immagine per effettuare la ricerca dei pixel più
    % velocemente
    %
    im_target1_curr = imresize(imcrop(image, rect_target1),0.2);
    %
    % --------- Cerco i colori --------
    %
    disp('*************************** Colori del target4  ************************')
    % Leggo le dimensioni dell'immagine
    %
    [width, height, depth] = size(im_target4_curr);
    %
    % Faccio una scansione di tutta l'immagine del target4 
    %
    if strcmp(intestazione,'VDV')==1
        for x = 1 : width;
            for y = 1: height;
                allBlue_target4 = sum((im_target4_curr(:, :, 1)>=lowBlueR & im_target4_curr(:, :, 1)<=highBlueR) & (im_target4_curr(:, :, 2)>=lowBlueG & im_target4_curr(:, :, 2)<=highBlueG) & (im_target4_curr(:, :, 3)>=lowBlueB & im_target4_curr(:, :, 3)<=highBlueB) & (im_target4_curr(:, :, 3)-im_target4_curr(:, :, 1))>50 & (im_target4_curr(:, :, 3)-im_target4_curr(:, :, 2))>50  );
                allWhite_target4 = sum((im_target4_curr(:, :, 1)>=lowWhiteR & im_target4_curr(:, :, 1)<=highWhiteR) & (im_target4_curr(:, :, 2)>=lowWhiteG & im_target4_curr(:, :, 2)<=highWhiteG) & (im_target4_curr(:, :, 3)>=lowWhiteB & im_target4_curr(:, :, 3)<=highWhiteB) & (im_target4_curr(:, :, 1)-im_target4_curr(:, :, 3))>7);
                allGrey_target4 = sum((im_target4_curr(:, :, 3)-im_target4_curr(:, :, 1))<50 & (im_target4_curr(:, :, 3)-im_target4_curr(:, :, 2))<50);
                all_target4 = sum(im_target4_curr(:, :, 1) & im_target4_curr(:, :, 2) & im_target4_curr(:, :, 3));
            end
        end
    elseif strcmp(intestazione,'KWS')==1
        for x = 1 : width;
            for y = 1: height;
                allBlue_target4 = sum((im_target4_curr(:, :, 1)>=lowBlueR & im_target4_curr(:, :, 1)<=highBlueR) & (im_target4_curr(:, :, 2)>=lowBlueG & im_target4_curr(:, :, 2)<=highBlueG) & (im_target4_curr(:, :, 3)>=lowBlueB & im_target4_curr(:, :, 3)<=highBlueB) & (im_target4_curr(:, :, 3)-im_target4_curr(:, :, 1))>10 & (im_target4_curr(:, :, 2)-im_target4_curr(:, :, 1))>2  );
                allWhite_target4 = sum((im_target4_curr(:, :, 1)>=lowWhiteR & im_target4_curr(:, :, 1)<=highWhiteR) & (im_target4_curr(:, :, 2)>=lowWhiteG & im_target4_curr(:, :, 2)<=highWhiteG) & (im_target4_curr(:, :, 3)>=lowWhiteB & im_target4_curr(:, :, 3)<=highWhiteB) & (im_target4_curr(:, :, 3)-im_target4_curr(:, :, 2))>10 & (im_target4_curr(:, :, 2)-im_target4_curr(:, :, 1))>10 & (im_target4_curr(:, :, 3)-im_target4_curr(:, :, 1))>10);
                allGrey_target4 = sum((im_target4_curr(:, :, 3)-im_target4_curr(:, :, 2))<10 & (im_target4_curr(:, :, 2)-im_target4_curr(:, :, 1))<10 & (im_target4_curr(:, :, 3)-im_target4_curr(:, :, 1))<10 );
                all_target4 = sum(im_target4_curr(:, :, 1) & im_target4_curr(:, :, 2) & im_target4_curr(:, :, 3));
            end
        end
    else
        disp('ATTENZIONE: non so come cercare i colori nel target4')
    end
    %conto il numero di pixel che sono nel range del BLU
    sommacountBlue_target4=sum(allBlue_target4);
    BluePixels_current_target4=strcat('Numero di pixel nel range del blu del target4:',num2str(sommacountBlue_target4));
    disp(BluePixels_current_target4)
    %conto il numero di pixel che sono nel range del BIANCO
    sommacountWhite_target4=sum(allWhite_target4);
    WhitePixels_current_target4=strcat('Numero di pixel nel range del bianco del target4:',num2str(sommacountWhite_target4));
    disp(WhitePixels_current_target4)
    %conto il numero di pixel che sono nel range del GRIGIO
    sommacountGrey_target4=sum(allGrey_target4);
    GreyPixels_current_target4=strcat('Numero di pixel nel range del grigio del target4:',num2str(sommacountGrey_target4));
    disp(GreyPixels_current_target4)
    %conto il numero di pixel totali 
    sommacountAll_target4=sum(all_target4);
    AllPixels_current_target4=strcat('Numero di pixel totali del target4:',num2str(sommacountAll_target4));
    disp(AllPixels_current_target4)
    %
    disp('*************************** Colori del target3  ************************')
    % Leggo le dimensioni dell'immagine
    %
    [width, height, depth] = size(im_target3_curr);
    %
    % Faccio una scansione di tutta l'immagine del target3 
    %
    if strcmp(intestazione,'VDV')==1
        for x = 1 : width;
            for y = 1: height;
                allWhite_target3 = sum((im_target3_curr(:, :, 1)>=lowWhiteR & im_target3_curr(:, :, 1)<=highWhiteR) & (im_target3_curr(:, :, 2)>=lowWhiteG & im_target3_curr(:, :, 2)<=highWhiteG) & (im_target3_curr(:, :, 3)>=lowWhiteB & im_target3_curr(:, :, 3)<=highWhiteB) & (im_target3_curr(:, :, 1)-im_target3_curr(:, :, 3))>7);
                allGrey_target3 = sum((im_target3_curr(:, :, 1)-im_target3_curr(:, :, 2))<10 & (im_target3_curr(:, :, 3)-im_target3_curr(:, :, 1))<20);
                all_target3 = sum(im_target3_curr(:, :, 1) & im_target3_curr(:, :, 2) & im_target3_curr(:, :, 3));
            end
        end
    elseif strcmp(intestazione,'KWS')==1
        for x = 1 : width;
            for y = 1: height;
                allWhite_target3 = sum((im_target3_curr(:, :, 1)>=lowWhiteR & im_target3_curr(:, :, 1)<=highWhiteR) & (im_target3_curr(:, :, 2)>=lowWhiteG & im_target3_curr(:, :, 2)<=highWhiteG) & (im_target3_curr(:, :, 3)>=lowWhiteB & im_target3_curr(:, :, 3)<=highWhiteB) & (im_target3_curr(:, :, 3)-im_target3_curr(:, :, 2))>10 & (im_target3_curr(:, :, 2)-im_target3_curr(:, :, 1))>10 & (im_target3_curr(:, :, 3)-im_target3_curr(:, :, 1))>10);
                allGrey_target3 = sum((im_target3_curr(:, :, 3)-im_target3_curr(:, :, 2))<10 & (im_target3_curr(:, :, 2)-im_target3_curr(:, :, 1))<10 & (im_target3_curr(:, :, 3)-im_target3_curr(:, :, 1))<10 );
                all_target3 = sum(im_target3_curr(:, :, 1) & im_target3_curr(:, :, 2) & im_target3_curr(:, :, 3));
            end
        end
    else
        disp('ATTENZIONE: non so come cercare i colori nel target3')
    end
    %conto il numero di pixel che sono nel range del BIANCO
    sommacountWhite_target3=sum(allWhite_target3);
    WhitePixels_current_target3=strcat('Numero di pixel nel range del bianco del target3:',num2str(sommacountWhite_target3));
    disp(WhitePixels_current_target3)
    %conto il numero di pixel che sono nel range del GRIGIO
    sommacountGrey_target3=sum(allGrey_target3);
    GreyPixels_current_target3=strcat('Numero di pixel nel range del grigio del target3:',num2str(sommacountGrey_target3));
    disp(GreyPixels_current_target3)
    %conto il numero di pixel totali 
    sommacountAll_target3=sum(all_target3);
    AllPixels_current_target3=strcat('Numero di pixel totali del target3:',num2str(sommacountAll_target3));
    disp(AllPixels_current_target3)
    %
    disp('*************************** Colori del target2  ************************')
    % Leggo le dimensioni dell'immagine
    %
    [width, height, depth] = size(im_target2_curr);
    %
    % Faccio una scansione di tutta l'immagine del target2 
    %
    if strcmp(intestazione,'VDV')==1
        for x = 1 : width;
            for y = 1: height;
                allWhite_target2 = sum((im_target2_curr(:, :, 1)>=lowWhiteR & im_target2_curr(:, :, 1)<=highWhiteR) & (im_target2_curr(:, :, 2)>=lowWhiteG & im_target2_curr(:, :, 2)<=highWhiteG) & (im_target2_curr(:, :, 3)>=lowWhiteB & im_target2_curr(:, :, 3)<=highWhiteB) & (im_target2_curr(:, :, 1)-im_target2_curr(:, :, 3))>7);
                allGrey_target2 = sum((im_target2_curr(:, :, 1)-im_target2_curr(:, :, 2))<10 & (im_target2_curr(:, :, 3)-im_target2_curr(:, :, 1))<20);
                all_target2 = sum(im_target2_curr(:, :, 1) & im_target2_curr(:, :, 2) & im_target2_curr(:, :, 3));
            end
        end
    elseif strcmp(intestazione,'KWS')==1
        for x = 1 : width;
            for y = 1: height;
                allWhite_target2 = sum((im_target2_curr(:, :, 1)>=lowWhiteR & im_target2_curr(:, :, 1)<=highWhiteR) & (im_target2_curr(:, :, 2)>=lowWhiteG & im_target2_curr(:, :, 2)<=highWhiteG) & (im_target2_curr(:, :, 3)>=lowWhiteB & im_target2_curr(:, :, 3)<=highWhiteB) & (im_target2_curr(:, :, 3)-im_target2_curr(:, :, 2))>10 & (im_target2_curr(:, :, 2)-im_target2_curr(:, :, 1))>10 & (im_target2_curr(:, :, 3)-im_target2_curr(:, :, 1))>10);
                allGrey_target2 = sum((im_target2_curr(:, :, 3)-im_target2_curr(:, :, 2))<10 & (im_target2_curr(:, :, 2)-im_target2_curr(:, :, 1))<10 & (im_target2_curr(:, :, 3)-im_target2_curr(:, :, 1))<10 );
                all_target2 = sum(im_target2_curr(:, :, 1) & im_target2_curr(:, :, 2) & im_target2_curr(:, :, 3));
            end
        end
    else
        disp('ATTENZIONE: non so come cercare i colori nel target2')
    end
    %conto il numero di pixel che sono nel range del BIANCO
    sommacountWhite_target2=sum(allWhite_target2);
    WhitePixels_current_target2=strcat('Numero di pixel nel range del bianco del target2:',num2str(sommacountWhite_target2));
    disp(WhitePixels_current_target2)
    %conto il numero di pixel che sono nel range del GRIGIO
    sommacountGrey_target2=sum(allGrey_target2);
    GreyPixels_current_target2=strcat('Numero di pixel nel range del grigio del target2:',num2str(sommacountGrey_target2));
    disp(GreyPixels_current_target2)
    %conto il numero di pixel totali 
    sommacountAll_target2=sum(all_target2);
    AllPixels_current_target2=strcat('Numero di pixel totali del target2:',num2str(sommacountAll_target2));
    disp(AllPixels_current_target2)
    %
    disp('*************************** Colori del target1  ************************')
    % Leggo le dimensioni dell'immagine
    %
    [width, height, depth] = size(im_target1_curr);
    %
    % Faccio una scansione di tutta l'immagine del target1 
    %
    if strcmp(intestazione,'VDV')==1
        for x = 1 : width;
            for y = 1: height;
                allBlue_target1 = sum((im_target1_curr(:, :, 1)>=lowBlueR & im_target1_curr(:, :, 1)<=highBlueR) & (im_target1_curr(:, :, 2)>=lowBlueG & im_target1_curr(:, :, 2)<=highBlueG) & (im_target1_curr(:, :, 3)>=lowBlueB & im_target1_curr(:, :, 3)<=highBlueB) & (im_target1_curr(:, :, 3)-im_target1_curr(:, :, 1))>50 & (im_target1_curr(:, :, 3)-im_target1_curr(:, :, 2))>50  );
                allWhite_target1 = sum((im_target1_curr(:, :, 1)>=lowWhiteR & im_target1_curr(:, :, 1)<=highWhiteR) & (im_target1_curr(:, :, 2)>=lowWhiteG & im_target1_curr(:, :, 2)<=highWhiteG) & (im_target1_curr(:, :, 3)>=lowWhiteB & im_target1_curr(:, :, 3)<=highWhiteB) & (im_target1_curr(:, :, 1)-im_target1_curr(:, :, 3))>7);
                allGrey_target1 = sum((im_target1_curr(:, :, 1)-im_target1_curr(:, :, 2))<10 & (im_target1_curr(:, :, 3)-im_target1_curr(:, :, 1))<20);
                all_target1 = sum(im_target1_curr(:, :, 1) & im_target1_curr(:, :, 2) & im_target1_curr(:, :, 3));
            end
        end
    elseif strcmp(intestazione,'KWS')==1
        for x = 1 : width;
            for y = 1: height;
                allBlue_target1 = sum((im_target1_curr(:, :, 1)>=lowBlueR & im_target1_curr(:, :, 1)<=highBlueR) & (im_target1_curr(:, :, 2)>=lowBlueG & im_target1_curr(:, :, 2)<=highBlueG) & (im_target1_curr(:, :, 3)>=lowBlueB & im_target1_curr(:, :, 3)<=highBlueB) & (im_target1_curr(:, :, 3)-im_target1_curr(:, :, 1))>10 & (im_target1_curr(:, :, 2)-im_target1_curr(:, :, 1))>2  );
                allWhite_target1 = sum((im_target1_curr(:, :, 1)>=lowWhiteR & im_target1_curr(:, :, 1)<=highWhiteR) & (im_target1_curr(:, :, 2)>=lowWhiteG & im_target1_curr(:, :, 2)<=highWhiteG) & (im_target1_curr(:, :, 3)>=lowWhiteB & im_target1_curr(:, :, 3)<=highWhiteB) & (im_target1_curr(:, :, 3)-im_target1_curr(:, :, 2))>10 & (im_target1_curr(:, :, 2)-im_target1_curr(:, :, 1))>10 & (im_target1_curr(:, :, 3)-im_target1_curr(:, :, 1))>10);
                allGrey_target1 = sum((im_target1_curr(:, :, 3)-im_target1_curr(:, :, 2))<10 & (im_target1_curr(:, :, 2)-im_target1_curr(:, :, 1))<10 & (im_target1_curr(:, :, 3)-im_target1_curr(:, :, 1))<10 );
                all_target1 = sum(im_target1_curr(:, :, 1) & im_target1_curr(:, :, 2) & im_target1_curr(:, :, 3));
            end
        end
    else
        disp('ATTENZIONE: non so come cercare i colori nel target1')
    end
    %conto il numero di pixel che sono nel range del BLU
    sommacountBlue_target1=sum(allBlue_target1);
    BluePixels_current_target1=strcat('Numero di pixel nel range del blu del target1:',num2str(sommacountBlue_target1));
    disp(BluePixels_current_target1)
    %conto il numero di pixel che sono nel range del BIANCO
    sommacountWhite_target1=sum(allWhite_target1);
    WhitePixels_current_target1=strcat('Numero di pixel nel range del bianco del target1:',num2str(sommacountWhite_target1));
    disp(WhitePixels_current_target1)
    %conto il numero di pixel che sono nel range del GRIGIO
    sommacountGrey_target1=sum(allGrey_target1);
    GreyPixels_current_target1=strcat('Numero di pixel nel range del grigio del target1:',num2str(sommacountGrey_target1));
    disp(GreyPixels_current_target1)
    %conto il numero di pixel totali 
    sommacountAll_target1=sum(all_target1);
    AllPixels_current_target1=strcat('Numero di pixel totali del target1:',num2str(sommacountAll_target1));
    disp(AllPixels_current_target1)
       
    %
    % Che tempo fa ?
    %
    disp('****************** Controllo della nebbia sui vari target **************')
    if (sommacountAll_target1-sommacountWhite_target1<150) || (sommacountAll_target1-sommacountBlue_target1<150)
        disp('ATTENZIONE: target1 offuscato, probabile nebbia molto fitta')
        colore_target1='bianco';
    elseif (sommacountAll_target2-sommacountWhite_target2<150) 
        disp('ATTENZIONE: target2 offuscato, probabile nebbia fitta')
        colore_target2='bianco';
    elseif (sommacountAll_target3-sommacountWhite_target3<150) 
        disp('ATTENZIONE: target3 offuscato, probabile nebbia')
        colore_target3='bianco';
    elseif (sommacountAll_target4-sommacountGrey_target4<150 && sommacountWhite_target4>10 && sommacountWhite_target4<100 && sommacountBlue_target4>50 && sommacountBlue_target4<300) || (sommacountAll_target4-sommacountWhite_target4<150 && sommacountBlue_target4==0 && sommacountBlue_target4>50 && sommacountBlue_target4<300)
        disp('ATTENZIONE: target4 offuscato, probabile foschia')
        colore_target4='bianco';
    else
        disp('TUTTI I TARGET SONO VISIBILI')
    end
    % 
   