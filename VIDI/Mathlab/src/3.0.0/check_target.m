    %
    % Script che serve per individuare i colori del cielo
    %
    %carica_config_sito
    %carica_algoritmi
    %
    disp('*********************** Riconoscimento dei target  *********************')

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
    im_target4_curr = imcrop(edge(rgb2gray(image),'roberts',0.02), rect_target4); 
    im_target4_rif = imcrop(edge(rgb2gray(im_rif_col),'roberts',0.03), rect_target4);
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
    im_target3_curr = imcrop(edge(rgb2gray(image),'roberts',0.02), rect_target3);
    im_target3_rif = imcrop(edge(rgb2gray(im_rif_col),'roberts',0.03), rect_target3);    
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
    im_target2_curr = imcrop(edge(rgb2gray(image),'roberts',0.02), rect_target2);
    im_target2_rif = imcrop(edge(rgb2gray(im_rif_col),'roberts',0.03), rect_target2);    
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
    im_target1_curr = imcrop(edge(rgb2gray(image),'roberts',0.02), rect_target1);
    im_target1_rif = imcrop(edge(rgb2gray(im_rif_col),'roberts',0.03), rect_target1);    
    %
    % --------- Cerco i colori --------
    %
    disp('******************* Confronto istogramma del target4  ******************')
    %
    % Controlliamo se il target4 viene visualizzato correttamente
    %
    [correlaz_target4]=check_target_cross(im_target4_curr,im_target4_rif);
    correlazione_target4=strcat('Valore errore target4:',num2str(correlaz_target4));
    disp(correlazione_target4)  
    %
    disp('******************* Confronto istogramma del target3  ******************')
    %
    % Controlliamo se il target3 viene visualizzato correttamente
    %
    [correlaz_target3]=check_target_cross(im_target3_curr,im_target3_rif);
    correlazione_target3=strcat('Valore errore target3:',num2str(correlaz_target3));
    disp(correlazione_target3)  
    %
    disp('******************* Confronto istogramma del target2  ******************')
    %
    % Controlliamo se il target2 viene visualizzato correttamente
    %
    [correlaz_target2]=check_target_cross(im_target2_curr,im_target2_rif);
    correlazione_target2=strcat('Valore errore target2:',num2str(correlaz_target2));
    disp(correlazione_target2)  
    %    
    disp('******************* Confronto istogramma del target1  ******************')
    %
    % Controlliamo se il target2 viene visualizzato correttamente
    %
    [correlaz_target1]=check_target_cross(im_target1_curr,im_target1_rif);
    correlazione_target1=strcat('Valore errore target1:',num2str(correlaz_target1));
    disp(correlazione_target1)  
    %  

       
    %
    % Che tempo fa ?
    %
    disp('****************** Controllo della nebbia sui vari target **************')
    if (correlaz_target1>err_max_target1)
        disp('ATTENZIONE: target1 offuscato, probabile nebbia molto fitta')
        colore_target1='bianco';
    elseif (correlaz_target2>err_max_target2)  
        disp('ATTENZIONE: target2 offuscato, probabile nebbia fitta')   
        colore_target2='bianco';
    elseif (correlaz_target3>err_max_target3) 
        disp('ATTENZIONE: target3 offuscato, probabile nebbia')
        colore_target3='bianco';
    elseif (correlaz_target4>err_max_target4)
        disp('ATTENZIONE: target4 offuscato, probabile foschia')
        colore_target4='bianco';
    else
        disp('TUTTI I TARGET SONO VISIBILI')
    end
    % 