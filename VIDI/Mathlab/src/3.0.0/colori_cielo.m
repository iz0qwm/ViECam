    %
    % Script che serve per individuare i colori del cielo
    %
    %carica_config_sito
    %carica_algoritmi
    %
    disp('********************* Valori dei colori predominanti del cielo  ********************')

    %
    % Questo è il rettangolo del cielo.
    % Ho utilizzato cielo.m per cercare le coordinate
    % rect = [x_vertice, y_vertice, larghezza, altezza]
    Coord_cielo_x_vertice=single(coord_cielo_x_vertice);
    Coord_cielo_y_vertice=single(coord_cielo_y_vertice);
    Coord_cielo_larghezza=single(coord_cielo_larghezza);
    Coord_cielo_altezza=single(coord_cielo_altezza);
    %
    rect = [Coord_cielo_x_vertice Coord_cielo_y_vertice Coord_cielo_larghezza Coord_cielo_altezza]; 
    %
    % Ritaglio il solo rettangolo del cielo e rimpicciolisco l'immagine per effettuare la ricerca dei pixel più
    % velocemente
    %
    im_cielo_curr = imresize(imcrop(image, rect),0.2); 
    im_cielo_rif = imresize(imcrop(im_rif, rect),0.2);
    %
    % Trovo gli edge del cielo per ricavare il contrasto
    im_pearson_cielo = edge(im_cielo_rif,'sobel');
    % Trasformo in livelli di grigio il cielo per ricavare il contrasto
    im_cielo_curr_gray = rgb2gray(im_cielo_curr);
    %
    % Pannello per vedere i vari canali del cielo
    %
    %fontSize = 16; 
    %subplot(3, 4, 1);
	%imshow(im_cielo_curr);
    %subplot(3, 4, 2);
	%imshow(im_cielo_curr(:, :, 1));
	%title('Red Band', 'FontSize', fontSize);
    %subplot(3, 4, 3);
	%imshow(im_cielo_curr(:, :, 2));
	%title('Green Band', 'FontSize', fontSize);
    %subplot(3, 4, 4);
	%imshow(im_cielo_curr(:, :, 3));
	%title('Blue Band', 'FontSize', fontSize);
    %
    % Leggo le dimensioni dell'immagine
    %
    [width, height, depth] = size(im_cielo_curr);
    %
    % Faccio una scansione di tutta l'immagine del Cielo dell'immagine
    % corrente e 
    %
    if strcmp(intestazione,'VDV')==1
        for x = 1 : width;
            for y = 1: height;
                allBlue = sum((im_cielo_curr(:, :, 1)>=lowBlueR & im_cielo_curr(:, :, 1)<=highBlueR) & (im_cielo_curr(:, :, 2)>=lowBlueG & im_cielo_curr(:, :, 2)<=highBlueG) & (im_cielo_curr(:, :, 3)>=lowBlueB & im_cielo_curr(:, :, 3)<=highBlueB) );
                allWhite = sum((im_cielo_curr(:, :, 1)>=lowWhiteR & im_cielo_curr(:, :, 1)<=highWhiteR) & (im_cielo_curr(:, :, 2)>=lowWhiteG & im_cielo_curr(:, :, 2)<=highWhiteG) & (im_cielo_curr(:, :, 3)>=lowWhiteB & im_cielo_curr(:, :, 3)<=highWhiteB) & (im_cielo_curr(:, :, 3)-im_cielo_curr(:, :, 1)<10));
                allGrey = sum(im_cielo_curr(:, :, 3)<=239 & im_cielo_curr(:, :, 3)>=161 & im_cielo_curr(:, :, 2)<=202 & im_cielo_curr(:, :, 2)>=126 & im_cielo_curr(:, :, 1)>=63 & im_cielo_curr(:, :, 1)<=145);
                all = sum(im_cielo_curr(:, :, 1) & im_cielo_curr(:, :, 2) & im_cielo_curr(:, :, 3));
                %lum = sum(0.299*im_cielo_curr(:, :, 1) + 0.587*im_cielo_curr(:, :, 2) + 0.114*im_cielo_curr(:, :, 3));
            end
        end
    elseif strcmp(intestazione,'KWS')==1
        for x = 1 : width;
            for y = 1: height;
                allBlue = sum((im_cielo_curr(:, :, 1)>=lowBlueR & im_cielo_curr(:, :, 1)<=highBlueR) & (im_cielo_curr(:, :, 2)>=lowBlueG & im_cielo_curr(:, :, 2)<=highBlueG) & (im_cielo_curr(:, :, 3)>=lowBlueB & im_cielo_curr(:, :, 3)<=highBlueB) & (im_cielo_curr(:, :, 3)-im_cielo_curr(:, :, 2))>20 & (im_cielo_curr(:, :, 2)-im_cielo_curr(:, :, 1))>30 );
                allWhite = sum((im_cielo_curr(:, :, 1)>=lowWhiteR & im_cielo_curr(:, :, 1)<=highWhiteR) & (im_cielo_curr(:, :, 2)>=lowWhiteG & im_cielo_curr(:, :, 2)<=highWhiteG) & (im_cielo_curr(:, :, 3)>=lowWhiteB & im_cielo_curr(:, :, 3)<=highWhiteB) & (im_cielo_curr(:, :, 3)-im_cielo_curr(:, :, 2))>10 & (im_cielo_curr(:, :, 2)-im_cielo_curr(:, :, 1))>10 & (im_cielo_curr(:, :, 3)-im_cielo_curr(:, :, 1))>10);
                allGrey = sum((im_cielo_curr(:, :, 3)-im_cielo_curr(:, :, 2))<10 & (im_cielo_curr(:, :, 2)-im_cielo_curr(:, :, 1))<10 & (im_cielo_curr(:, :, 3)-im_cielo_curr(:, :, 1))<10 );
                all = sum(im_cielo_curr(:, :, 1) & im_cielo_curr(:, :, 2) & im_cielo_curr(:, :, 3));
                %lum = sum(0.299*im_cielo_curr(:, :, 1) + 0.587*im_cielo_curr(:, :, 2) + 0.114*im_cielo_curr(:, :, 3));
            end
        end
    else
        disp('ATTENZIONE: non so come cercare i colori nel cielo')
    end
    %conto il numero di pixel che sono nel range del BLU
    sommacountBlue=sum(allBlue);
    BluePixels_current=strcat('Numero di pixel nel range del blu:',num2str(sommacountBlue));
    disp(BluePixels_current)
    %conto il numero di pixel che sono nel range del BIANCO
    sommacountWhite=sum(allWhite);
    WhitePixels_current=strcat('Numero di pixel nel range del bianco:',num2str(sommacountWhite));
    disp(WhitePixels_current)
    %conto il numero di pixel che sono nel range del GRIGIO
    sommacountGrey=sum(allGrey);
    GreyPixels_current=strcat('Numero di pixel nel range del grigio:',num2str(sommacountGrey));
    disp(GreyPixels_current)
    %conto il numero di pixel totali 
    sommacountAll=sum(all);
    AllPixels_current=strcat('Numero di pixel totali:',num2str(sommacountAll));
    disp(AllPixels_current)
    %calcolo il contrasto medio del cielo
    contrasto_medio=mean_contrast(im_cielo_curr_gray,im_pearson_cielo);
    meanContrast_current=strcat('Contrasto medio del cielo:',num2str(contrasto_medio));
    disp(meanContrast_current)
    %
    % Che tempo fa ?
    %
    disp('******************************* Stato del tempo corrente ***************************')
    if strcmp(intestazione,'VDV')==1
        tempopresente=copertura_nuvolosa_VDV(sommacountBlue,sommacountWhite,sommacountGrey,sommacountAll,contrasto_medio);
    elseif strcmp(intestazione,'KWS')==1
        tempopresente=copertura_nuvolosa_KWS(sommacountBlue,sommacountWhite,sommacountGrey,sommacountAll,contrasto_medio);
    else
        disp('ATTENZIONE: non esiste lo script per la copertura nuvolosa')
    end
    % 
   