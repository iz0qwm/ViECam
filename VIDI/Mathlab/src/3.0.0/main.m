%main. Gestisce input e output per il blocco image processing
clear all
close all
warning off MATLAB:MKDIR:DirectoryExists
%
% Carico il file delle Varibili del sito
%
disp('Carico vidi_sito.ini')
carica_config_sito
%
% Creo il file cache per non dover ricercare sempre le immagini dei target
% e le relative coordinate
%
mkdir(cartella,'data');
file_cache=strcat(cartella,'data\pearson1.mat');
if size(dir(file_cache),1)==0
    
%
% viene creata una struct contentente
%     i nomi dei file dei target selezionati
trgts={['C:\VIDI\Maschere\target1_' num2str(Target1) '.jpg']...
       ['C:\VIDI\Maschere\target2_' num2str(Target2_1) '_1.jpg']...
       ['C:\VIDI\Maschere\target2_' num2str(Target2_2) '_2.jpg']...
       ['C:\VIDI\Maschere\target3_' num2str(Target3_1) '_1.jpg']...
       ['C:\VIDI\Maschere\target3_' num2str(Target3_2) '_2.jpg']...
       ['C:\VIDI\Maschere\target3_' num2str(Target3_3) '_3.jpg']...
       ['C:\VIDI\Maschere\target4_' num2str(Target4_1) '_1.jpg']...
       ['C:\VIDI\Maschere\target4_' num2str(Target4_2) '_2.jpg']...
       ['C:\VIDI\Maschere\target4_' num2str(Target4_3) '_3.jpg']};
%dist_trgts è il vettore delle distanze; il primo elemento è associato al primo target e così via
target1=single(Target1);
target2_1=single(Target2_1);
target2_2=single(Target2_2);
target3_1=single(Target3_1);
target3_2=single(Target3_2);
target3_3=single(Target3_3);
target4_1=single(Target4_1);
target4_2=single(Target4_2);
target4_3=single(Target4_3);
dist_trgts=[target1 target2_1 target2_2 target3_1 target3_2 target3_3 target4_1 target4_2 target4_3];
%Esempio: dist_trgts=[30 2000 2000 5000 5000 5000 15000 15000 15000];
%nel seguente ciclo, vengono calcolate, per ogni target, le sue coordinate;
%tale funzione è svolta da "coordinate maschere", che a partire
%dall'immagine di riferimento, 
%restituisce le sue coordinate. Nello stesso ciclo, viene creata una struct
%"mask" contentente le maschere e le distanze di ogni target. Le maschere
%sono create dalla funzione "maschere_su_immagine_riferimento" che ritaglia
%l'immagine di riferimento in corrispondenza delle coordinate dei target
%
% Elaborazione immagine
%
%
% Filtro gaussiano per effettuare un blur dell'immagine ed evitare le
% imperfezioni
%
h=fspecial('gaussian',2,2);
%
%
% Scelta del tipo di elaborazione dell'immagine per ricercare meglio i
% target all'interno dell'immagine di riferimento
%
%im_pearson = im_rif; %estraggo i bordi dall'immagine che evidenzia le superfici lambertiane
%im_pearson = rgb2gray(im_rif_col);
%im_pearson = edge(imfilter(im_rif_col(:,:,2),h),'roberts',0.01);
im_pearson = imfilter(im_rif_col(:,:,3),h);
%
disp('****************************** STARTUP INIZIALE ************************************')
disp('************ Ricerca coordinate dei target su immagine di riferimento **************')
disp('************************* Calcolo dei coefficienti di pearson **********************')
%
mask_pearson={};
%
for l=1:size(trgts,2)
    %disp(size(trgts,2))
    %disp(trgts(l))

    imm_targts=imread(trgts{l}); 
    imm_target=imfilter(imm_targts(:,:,3),h);
    %imm_target=edge(imfilter(imm_targts(:,:,2),h),'roberts',0.01);
    %nometarget=strcat('Target:',trgts{l});
    %disp(nometarget)
    %
    % Scelta del tipo di elaborazione dell'immagine per ricercare meglio i
    % target all'interno dell'immagine di riferimento
    %
    %coord_mask(l,:,:)=coordinate_maschere(im_rif,RGB2EDGE(imread(trgts{l})));
    %coord_mask(l,:,:)=coordinate_maschere(rgb2gray(im_rif_col),rgb2gray(imread(trgts{l})));
    %coord_mask(l,:,:)=coordinate_maschere(edge(imfilter(im_rif_col(:,:,2),h),'roberts',0.01),edge(imfilter(imm_target(:,:,2),h),'roberts',0.01));
    coord_mask(l,:,:)=coordinate_maschere(im_pearson,imm_target);
    %disp('******')

    
end
for o=1:size(trgts,2)
    %*************************calcolo dei coefficienti di pearson**********************
    
    %
    %i target opportunamente trasformati in scala dri grigio, vanno ricercati sull'immagine 
    %di riferimento già trasformata in livelli di grigio
    %ritaglio in suddetta immagine i bordi in corrispondenza dei target
    %
    mask_pearson{o} = {maschere_su_immagine_riferimento(im_pearson,coord_mask(o,:,:)), dist_trgts(o)};
end
%************Inizializzazione**************
%disp('********************************* Inizializzazione *********************************')
%
% E' la prima volta che parte il software questo significa che devo farlo
% inizializzare con l'immagine di riferimento e non con quella corrente
%
%inizializzazione=1;
%

    
    % Salvo il file cache
    save(file_cache);
    %clear im_pearson
else
    load(file_cache);
end

disp('*************************** Inizializzazione variabili *****************************')
%
% Se inizializzazione è impostato a 1 significa che devo azzerare il file
% visibility.mat
file_cache_visibility=strcat(cartella,'data\visibility.mat');
%
%if inizializzazione == 1
    %delete(file_cache_visibility);
    %disp('Il software è appena partito, ho cancellato il file visibility.mat')
 %   disp('Eseguo la prima routine  con l''immagine di riferimento')
 %   disp('************************************************************************************')

%end

% if size(dir(file_cache_visibility),1)==0
%
% Azzero tutte le variabili
%
k=0;
%visibilità assoluta di ciascuna maschera da immagine con superfici lambertiane
abs_visibility_pearson=zeros(round((datenum(data_fine)-datenum(data_inizio))*24*60),size(trgts,2));
%vettore che contiente ciascun addendo della sommatoria per il calcolo della visibilità per maschere lambertiane
rel_visibility_pearson=zeros(size(trgts,2),1);
%somma delle visibilità relative per maschere lambertiane
total_rel_vis_pearson=zeros(round((datenum(data_fine)-datenum(data_inizio))*24*60),1);
%massimo delle cross-correlazioni calcoltate per ciascun target per maschere lambertiane
max_xcorr_p=zeros(size(trgts,2),1);
%valori correnti delle cross-correlazioni per maschere lambertiane
xcor_p=zeros(round((datenum(data_fine)-datenum(data_inizio))*24*60),1);
%ci servirà per il confronto con il metodo di Hautiere
contrasto_medio=zeros(round((datenum(data_fine)-datenum(data_inizio))*24*60),1);

%il ciclo comincia dall'immagine successiva all'ultima analizzata nel
%while al rigo 48 e termina in "data_fine"
%for j=indici_imgs(end):(indici_imgs(end)+(round((datenum(data_fine)-datenum(data_inizio))*24*60)))
%mkdir(cartella,'results');
disp('******************************* Stima visibilita'' **********************************')

% Azzeriamo l'ultimo valore valido della visibilità
total_rel_vis_pearson_lastOK=0;


while 1
    %
    %
    % SEZIONE VISIBILITA' TOTALE 
    %
    %
    % Carico il file delle Varibili dell'algoritmo visibilità
    %
    disp('Carico vidi_algoritmi.ini')
    carica_algoritmi
    %
    %
    %
    k=k+1;
    % Se inizializzazione è impostato a 1 utilizzo l'immagine di
    % riferimento per inizializzare il file visibility.mat che è stato
    % cancellato
    %if inizializzazione == 1
    %    image=im_rif_col;
    %else
        image=imread(immagine_corrente);% viene caricata una nuova immagine
    %end
    %
    % Ora trasformo in grigio l'immagine corrente
    %
    imm_t_gray = rgb2gray(image);
    %
    % Individuiamo i colori del cielo e determiniamo il tempo presente
    %
    tempopresente='';
    colore_target1='';
    colore_target2='';
    colore_target3='';
    colore_target4='';
    %
    if check_tempopresente==0
        tempopresente='unavailable';
    else
        colori_cielo
    end
    %
        if check_offuscamento==0
            disp('CONTROLLO OFFUSCAMENTO TARGET: NON ATTIVO')
            %
            % Individuiamo i colori del cielo e determiniamo il tempo presente
            %
            tempopresente_all=strcat('Tempo in atto:',tempopresente);
            disp(tempopresente_all)
        else
            %
            % Vediamo se qualche target è di colore grigio. Questo significa che
            % sono coperti o che c'è nebbia negli strati bassi nonostante il tempo presente risulti bello 
            %
            %if strcmp(intestazione,'VDV')==1
            %    check_target
            %elseif strcmp(intestazione,'KWS')==1
                check_target
            %end
                if strcmp(colore_target1,'bianco')==1 || strcmp(colore_target2,'bianco')==1 
                    tempopresente='Fog';
                    tempopresente_all=strcat('Tempo in atto:',tempopresente);
                    disp(tempopresente_all)
                elseif strcmp(colore_target3,'bianco')==1
                    tempopresente='Mist';
                    tempopresente_all=strcat('Tempo in atto:',tempopresente);
                    disp(tempopresente_all)               
                elseif strcmp(colore_target4,'bianco')==1
                    tempopresente='Mist';
                    tempopresente_all=strcat('Tempo in atto:',tempopresente);
                    disp(tempopresente_all)               
                else
                    %
                    % Individuiamo i colori del cielo e determiniamo il tempo presente
                    %
                    tempopresente_all=strcat('Tempo in atto:',tempopresente);
                    disp(tempopresente_all)
                end

        end

    disp('************************************************************************************')

    %
    % impostazione varibili delle date
    %
    time(k) = now;
    datestr(time(k),'YYmmddHHMMSS');
    %
    % Carichiamo le variabili delle date
    %
    variabili_date
    %
    %
    % Scelta del tipo di elaborazione dell'immagine per ricercare meglio i
    % target all'interno dell'immagine corrente.
    %
    %imm_t = edge(imm_t_gray,'roberts',0.02);
    %imm_t = edge(imm_t_gray,'roberts',0.009);
    %imm_t = imm_t_gray;
    %imm_t = edge(imfilter(image(:,:,2),h),'roberts',0.01);
    imm_t = imfilter(image(:,:,3),h);
    %imm_t=RGB2EDGE(image);%estraggo i bordi dall'immagine
    % *******************calcolo visibilità con distanza assoluta di ogni target ***********
    for trg_i=1:size(trgts,2)
        %disp(trg_i)
        
        % Visibilità con Pearson
        %[abs_visibility_pearson(k,trg_i) max_xcorr_p(trg_i) xcor_p(k)]=trg_vis_est(tollerance_comparison,mask_pearson{trg_i},coord_mask(trg_i,:,:),imm_t,max_xcorr_p(trg_i));
        %
        % Sezione Visibilità con maschera di pearson. E' quella attualmente
        % utilizzata
        %
        % Scelgo l'ultimo valore della abs_visibility_pearson e cioè la
        % visibilità relativa ad ogni target
        %
        %nometarget=strcat('Target:',trgts{trg_i});
        %disp(nometarget)
        rel_visibility_pearson(trg_i)=trg_vis_est(tollerance_comparison,mask_pearson{trg_i},coord_mask(trg_i,:,:),imm_t,max_xcorr_p(trg_i));
        %disp('*****')
        %
    end
    %save([cartella 'results' filesep datesave '.txt'],'total_rel_vis(k)','-ascii')
        

    % Trovo il massimo valore delle visibilità relative
    %
    % Se check_offuscamento è attivo, non devo calcolare fra il rel_vis_arr
    % i target offuscati
    %
    if check_offuscamento==0
        rel_vis_arr = [rel_visibility_pearson(9),rel_visibility_pearson(8),rel_visibility_pearson(7),rel_visibility_pearson(6),rel_visibility_pearson(5),rel_visibility_pearson(4),rel_visibility_pearson(3),rel_visibility_pearson(2),rel_visibility_pearson(1)];
    else
        if strcmp(colore_target4,'bianco')==1
            rel_vis_arr = [rel_visibility_pearson(6),rel_visibility_pearson(5),rel_visibility_pearson(4),rel_visibility_pearson(3),rel_visibility_pearson(2),rel_visibility_pearson(1)];
        elseif strcmp(colore_target3,'bianco')==1
            rel_vis_arr = [rel_visibility_pearson(3),rel_visibility_pearson(2),rel_visibility_pearson(1)];
        elseif strcmp(colore_target1,'bianco')==1 || strcmp(colore_target2,'bianco')==1
            rel_vis_arr = [rel_visibility_pearson(2),rel_visibility_pearson(1)];
        else
            rel_vis_arr = [rel_visibility_pearson(9),rel_visibility_pearson(8),rel_visibility_pearson(7),rel_visibility_pearson(6),rel_visibility_pearson(5),rel_visibility_pearson(4),rel_visibility_pearson(3),rel_visibility_pearson(2),rel_visibility_pearson(1)];
        end
    end
    rel_vis_max = max(rel_vis_arr(:));
    %
    % SEZIONE VISIBILITA' TOTALE
    %
    if check_tempopresente==0
           disp('CONTROLLO TEMPO PRESENTE: NON ATTIVO')
           if rel_vis_max<off_visallfog_max
               total_rel_vis_pearson(k)=gain_visallfog*(abs(rel_vis_max)); 
               disp('Nebbia fitta: visallfog')
           elseif rel_vis_max<off_visfog_max
               total_rel_vis_pearson(k)=gain_visfog*(abs(rel_vis_max));
               disp('Nebbia: visfog')
           elseif rel_vis_max<off_vismist_max
               total_rel_vis_pearson(k)=gain_vismist*(abs(rel_vis_max));
               disp('Foschia: vismist')
           elseif rel_vis_max<off_viscover_max
               total_rel_vis_pearson(k)=gain_viscover*(abs(rel_vis_max));
               disp('Visibilità buona ma pochi edges sullo sfondo: viscover')
           elseif rel_vis_max<off_visgood_max
               total_rel_vis_pearson(k)=gain_visgood*(abs(rel_vis_max));
               disp('Visibilità molto buona: visgood')
           elseif rel_vis_max<off_vismax_max
               total_rel_vis_pearson(k)=gain_vismax*(abs(rel_vis_max));
               disp('Visibilità massima: vismax')
           end
    else    
        %
        % Sunny Sky
        %
        if strcmp(tempopresente,'Sunny Sky')==1
            % Visibilità ottima   
            if rel_vis_max<off_viscover_max
                total_rel_vis_pearson(k)=sunny_sky_gain_visgood*gain_visgood*(abs(rel_vis_max));   
                            disp('Visibilità molto buona: visgood')
            % Visibilità massima (vismax)
            elseif rel_vis_max<off_vismax_max
                total_rel_vis_pearson(k)=sunny_sky_gain_vismax*gain_vismax*(abs(rel_vis_max)); 
                            disp('Visibilità massima: vismax')                       
            end   
        %
        % Clear Sky
        %        
        elseif strcmp(tempopresente,'Clear Sky')==1
            % Visibilità ottima   
            if rel_vis_max<off_visgood_max
                total_rel_vis_pearson(k)=clear_sky_gain_visgood*gain_visgood*(abs(rel_vis_max));   
                            disp('Visibilità molto buona: visgood')
            % Visibilità massima (vismax)
            elseif rel_vis_max<off_vismax_max
                total_rel_vis_pearson(k)=clear_sky_gain_vismax*gain_vismax*(abs(rel_vis_max)); 
                            disp('Visibilità massima: vismax')                             
            end   
        %
        % Partly cloudy
        %        
        elseif strcmp(tempopresente,'Partly cloudy')==1       
            % Visibilità buona ma pochi edge sullo sfondo (Nuvoloso)   
            if rel_vis_max<off_viscover_max
                            total_rel_vis_pearson(k)=partly_cloudy_gain_viscover*gain_viscover*(abs(rel_vis_max));   
                            disp('Visibilità buona ma pochi edges sullo sfondo: viscover')  
            % Visibilità ottima   
            elseif rel_vis_max<off_visgood_max
                total_rel_vis_pearson(k)=partly_cloudy_gain_visgood*gain_visgood*(abs(rel_vis_max));   
                            disp('Visibilità molto buona: visgood')
             % Visibilità massima (vismax)
            elseif rel_vis_max<off_vismax_max
                total_rel_vis_pearson(k)=partly_cloudy_gain_vismax*gain_vismax*(abs(rel_vis_max)); 
                            disp('Visibilità massima: vismax')                             
            end                             
        %
        % Cloudy
        %        
        elseif strcmp(tempopresente,'Cloudy')==1     
            % Foschia               
            if rel_vis_max<off_vismist_max
                            total_rel_vis_pearson(k)=cloudy_gain_vismist*gain_vismist*(abs(rel_vis_max)); 
                            disp('Foschia: vismist') 
            % Visibilità buona ma pochi edge sullo sfondo (Nuvoloso)   
            elseif rel_vis_max<off_viscover_max
                            total_rel_vis_pearson(k)=cloudy_gain_viscover*gain_viscover*(abs(rel_vis_max));   
                            disp('Visibilità buona ma pochi edges sullo sfondo: viscover') 
            % Visibilità ottima   
            elseif rel_vis_max<off_visgood_max
                total_rel_vis_pearson(k)=cloudy_gain_visgood*gain_visgood*(abs(rel_vis_max));   
                            disp('Visibilità molto buona: visgood')
            % Visibilità massima (vismax)
            elseif rel_vis_max<off_vismax_max
                total_rel_vis_pearson(k)=cloudy_gain_vismax*gain_vismax*(abs(rel_vis_max)); 
                            disp('Visibilità massima: vismax')                
            end      
        %
        % Broken clouds
        %        
            elseif strcmp(tempopresente,'Broken clouds')==1 
            % Foschia
            if rel_vis_max<off_vismist_max
                            total_rel_vis_pearson(k)=broken_clouds_gain_vismist*gain_vismist*(abs(rel_vis_max)); 
                            disp('Foschia: vismist')                        
            % Visibilità buona ma pochi edge sullo sfondo (Nuvoloso)   
            elseif rel_vis_max<off_viscover_max
                            total_rel_vis_pearson(k)=broken_clouds_gain_viscover*gain_viscover*(abs(rel_vis_max));   
                            disp('Visibilità buona ma pochi edges sullo sfondo: viscover') 
            % Visibilità ottima   
            elseif rel_vis_max<off_visgood_max
                total_rel_vis_pearson(k)=broken_clouds_gain_visgood*gain_visgood*(abs(rel_vis_max));   
                            disp('Visibilità molto buona: visgood')
            % Visibilità massima (vismax)
            elseif rel_vis_max<off_vismax_max
                total_rel_vis_pearson(k)=broken_clouds_gain_vismax*gain_vismax*(abs(rel_vis_max)); 
                            disp('Visibilità massima: vismax')                
            end          
        %
        % Overcast
        %        
        elseif strcmp(tempopresente,'Overcast')==1       
            % Foschia
            if rel_vis_max<off_vismist_max
                            total_rel_vis_pearson(k)=overcast_gain_vismist*gain_vismist*(abs(rel_vis_max)); 
                            disp('Foschia: vismist')            
            % Visibilità buona ma pochi edge sullo sfondo (Nuvoloso)   
            elseif rel_vis_max<off_viscover_max
                            total_rel_vis_pearson(k)=overcast_gain_viscover*gain_viscover*(abs(rel_vis_max));   
                            disp('Visibilità buona ma pochi edges sullo sfondo: viscover')  
            % Visibilità ottima   
            elseif rel_vis_max<off_visgood_max
                total_rel_vis_pearson(k)=overcast_gain_visgood*gain_visgood*(abs(rel_vis_max));   
                            disp('Visibilità molto buona: visgood')                      
            end
        %
        % Fog
        %         
        elseif strcmp(tempopresente,'Fog')==1        
            % Nebbia fitta
            if rel_vis_max<off_visallfog_max
                            total_rel_vis_pearson(k)=fog_gain_visallfog*gain_visallfog*(abs(rel_vis_max));  
                            disp('Nebbia fitta: visallfog')
            % Nebbia
            elseif rel_vis_max<off_visfog_max
                            total_rel_vis_pearson(k)=fog_gain_visfog*gain_visfog*(abs(rel_vis_max));  
                            disp('Nebbia: visfog')
                        
            % Foschia
            elseif rel_vis_max<off_vismist_max                    
                            total_rel_vis_pearson(k)=fog_gain_vismist*gain_vismist*(abs(rel_vis_max)); 
                            disp('Foschia: vismist')
       
            end
        %
        % Mist
        %         
        elseif strcmp(tempopresente,'Mist')==1                        
            % Nebbia
            if rel_vis_max<off_visfog_max
                            total_rel_vis_pearson(k)=mist_gain_visfog*gain_visfog*(abs(rel_vis_max));  
                            disp('Nebbia: visfog')
                        
            % Foschia
            elseif rel_vis_max<off_vismist_max                    
                            total_rel_vis_pearson(k)=mist_gain_vismist*gain_vismist*(abs(rel_vis_max)); 
                            disp('Foschia: vismist')
            % Visibilità buona ma pochi edge sullo sfondo (Nuvoloso)   
            elseif rel_vis_max<off_viscover_max
                            total_rel_vis_pearson(k)=mist_gain_viscover*gain_viscover*(abs(rel_vis_max));   
                            disp('Visibilità buona ma pochi edges sullo sfondo: viscover') 
            % Visibilità ottima   
            elseif rel_vis_max<off_visgood_max
                            total_rel_vis_pearson(k)=mist_gain_visgood*gain_visgood*(abs(rel_vis_max));   
                            disp('Visibilità molto buona: visgood')                     
       
            end                        
        % Non trovo nemmeno un target
        elseif ((rel_visibility_pearson(9)==-1) && (rel_visibility_pearson(8)==-1) && (rel_visibility_pearson(7)==-1) && (rel_visibility_pearson(6)==-1) && (rel_visibility_pearson(5)==-1) && (rel_visibility_pearson(4)==-1) && (rel_visibility_pearson(3)==-1) && (rel_visibility_pearson(2)==-1) && (rel_visibility_pearson(1)==-1))
            total_rel_vis_pearson(k)=0;
            disp('Non trovo neanche un target')
        end
    end
    
    %
    % Se per qualche motivo la visibilità totale non è calcolata
    % correttamente, viene utilizzato l'ultimo valore valido
    %
    if total_rel_vis_pearson(k)==0
        total_rel_vis_pearson(k)=total_rel_vis_pearson_lastOK;
    else
        total_rel_vis_pearson_lastOK=total_rel_vis_pearson(k);
    end
    %
    %
    % SEZIONE VISIBILITA' TOTALE 
    %
    %
   
    disp('******************************* Salvataggio risultati ******************************')

    disp('**************************** Distanze stimate dei target ***************************')
    trgt1_50=strcat(['target1 ' num2str(target1) 'm:'],num2str(fix(rel_visibility_pearson(1))));
    disp(trgt1_50)
    trgt2_100_1=strcat(['target2-1 ' num2str(target2_1) 'm:'],num2str(fix(rel_visibility_pearson(2))));
    disp(trgt2_100_1)
    trgt2_100_2=strcat(['target2-2 ' num2str(target2_2) 'm:'],num2str(fix(rel_visibility_pearson(3))));
    disp(trgt2_100_2)
    trgt3_4000_1=strcat(['target3-1 ' num2str(target3_1) 'm:'],num2str(fix(rel_visibility_pearson(4))));
    disp(trgt3_4000_1)
    trgt3_4000_2=strcat(['target3-2 ' num2str(target3_2) 'm:'],num2str(fix(rel_visibility_pearson(5))));
    disp(trgt3_4000_2)
    trgt3_4000_3=strcat(['target3-3 ' num2str(target3_3) 'm:'],num2str(fix(rel_visibility_pearson(6))));
    disp(trgt3_4000_3)
    trgt4_9000_1=strcat(['target4-1 ' num2str(target4_1) 'm:'],num2str(fix(rel_visibility_pearson(7))));
    disp(trgt4_9000_1)
    trgt4_9000_2=strcat(['target4-2 ' num2str(target4_2) 'm:'],num2str(fix(rel_visibility_pearson(8))));
    disp(trgt4_9000_2)
    trgt4_9000_3=strcat(['target4-3 ' num2str(target4_1) 'm:'],num2str(fix(rel_visibility_pearson(9))));
    disp(trgt4_9000_3)
    disp('*********************************** VISIBILITA'' ************************************')
    vis=fix(total_rel_vis_pearson(k));
    visibilita=strcat(['                                    ' num2str(vis) ' metri']);
    disp(visibilita)
    disp('************************************************************************************')
    %
    % Controllo se è notte per non salvare le immagini
    %
    sole_sorge=strcat('Il sole sorge alle: ',giorno);
    sole_tramonta=strcat('Il sole tramonta alle: ',notte);
    disp(sole_sorge)
    disp(sole_tramonta)
    %
    if data_ora_adesso > data_ora_giorno && data_ora_adesso < data_ora_notte 
        disp('*****************')
        disp('MODALITA'' GIORNO')
        disp('*****************')
        %
        % Cancello l'immagine precedente
        %
        delete([cartella_res intestazione '_vis*.jpg'])
        delete([cartella_res intestazione '_*_edge.jpg'])
        delete([cartella_res 'current_edge_tmp.jpg'])
        %
        % Salvo la nuova immagine
        %
        imwrite(image,[cartella_res intestazione '_Vis' num2str(fix(total_rel_vis_pearson(k))) '.jpg'],'jpg');
        imwrite(imm_t,[cartella_res intestazione '_' num2str(fix(total_rel_vis_pearson(k))) '_edge.jpg'],'jpg');
        % Immagini per la pagina web
        % Creo una temporanea per gli "edge della corrente" perchè risulta
        % utilizzata durante il trasferimento ftp
        imwrite(imresize(edge(imm_t,'roberts',0.02),0.5),[cartella_res 'current_edge_tmp.jpg'],'jpg');
        %copyfile([cartella_res 'current_edge_tmp.jpg'],[cartella_res 'current_edge.jpg'],'f');
        imwrite(im_rif_col,[cartella_res 'RIFERIMENTO.jpg'],'jpg');
        imwrite(im_pearson,[cartella_res 'RIFERIMENTO_edge.jpg'],'jpg');
        visibility_old = num2str(fix(total_rel_vis_pearson(k)));
        %
        % Salvo immagini daily
        %
        if exist([cartella_daily '\' datetoday],'dir')
            %
        else
            mkdir([cartella_daily datetoday])
        end
        imwrite(image,[cartella_daily datetoday '\' datesave '_Vis' num2str(fix(total_rel_vis_pearson(k))) '.jpg'],'jpg');
        imwrite(imm_t,[cartella_daily datetoday '\' datesave '_Vis' num2str(fix(total_rel_vis_pearson(k))) '_edge.jpg'],'jpg');
        %
        % File testuale con i risultati della giornata per creare il
        % grafico su pagina Web
        %
        datetimeweb = datestr(now,'HH:MM:SS');
        fileVISRECWEB = fopen([cartella_res 'visibility_chart_' intestazione '.txt'],'a');
        fprintf(fileVISRECWEB,'%s;%s\r\n',datetimeweb,num2str(fix(total_rel_vis_pearson(k))));
        fclose(fileVISRECWEB);
        %
        % File visibility per l'aggiornamento dell'applet su KWOS.org
        %
        if strcmp(sfondo,'nero')
            if strcmp(banner,'applet')
                % Sfondo nero e scritta bianca
                fileVIS = fopen([cartella_res 'visibility.txt'],'w');
                fprintf(fileVIS,'%s meters; ./ ; 0 ; 16777215 ; Arial ; 20 ; test',num2str(fix(total_rel_vis_pearson(k))));
                fclose(fileVIS);
            else
                % Sfondo nero e scritta bianca
                fileVIS = fopen([cartella_res 'visibility_value.htm'],'w');
                fprintf(fileVIS,'<html>\n<head>\n<title>Vidi values</title>\n</head>\n<body bgcolor="#000000">\n<p align="center"><b><font face="Terminal" color="#FFFFFF">');
                fprintf(fileVIS,'Current weather: %s - Visibility: ',tempopresente);
                fprintf(fileVIS,'%s m</font><br></b></p>\n</body></html>',num2str(fix(total_rel_vis_pearson(k))));
                fclose(fileVIS);
            end    
        else
            if strcmp(banner,'applet')  
                % Sfondo bianco e scritta nera
                fileVIS = fopen([cartella_res 'visibility.txt'],'w');
                fprintf(fileVIS,'%s meters; ./ ; 16777215 ; 0 ; Arial ; 20 ; test',num2str(fix(total_rel_vis_pearson(k))));    
                fclose(fileVIS);
            else
                % Sfondo nero e scritta bianca
                fileVIS = fopen([cartella_res 'visibility_value.htm'],'w');
                fprintf(fileVIS,'<html>\n<head>\n<title>Vidi values</title>\n</head>\n<body bgcolor="#FFFFFF">\n<p align="center"><b><font face="Terminal" color="#000000">');
                fprintf(fileVIS,'Current weather: %s - Visibility: ',tempopresente);
                fprintf(fileVIS,'%s m</font><br></b></p>\n</body></html>',num2str(fix(total_rel_vis_pearson(k))));
                fclose(fileVIS);
            end    
        end
    else
        disp('*****************')
        disp('MODALITA'' NOTTE')
        disp('*****************')
        %
        % Svuoto il file testuale con i risultati della giornata per creare il
        % grafico su pagina Web
        %
        delete([cartella_res 'visibility_chart_' intestazione '.txt'])
        fileVISRECWEB = fopen([cartella_res 'visibility_chart_' intestazione '.txt'],'a');
        fclose(fileVISRECWEB);
        %
        % File visibility per l'aggiornamento dell'applet su KWOS.org
        %
        night='NIGHTTIME';
        if strcmp(sfondo,'nero')
            if strcmp(banner,'applet')
                % Sfondo nero e scritta bianca
                fileVIS = fopen([cartella_res 'visibility.txt'],'w');
                fprintf(fileVIS,'%s; ./ ; 0 ; 16777215 ; Arial ; 20 ; test',night);
                fclose(fileVIS);
            else
                % Sfondo nero e scritta bianca
                fileVIS = fopen([cartella_res 'visibility_value.htm'],'w');
                fprintf(fileVIS,'<html>\n<head>\n<title>Vidi values</title>\n</head>\n<body bgcolor="#000000">\n<p align="center"><b><font face="Terminal" color="#FFFFFF">');
                fprintf(fileVIS,'%s</font><br></b></p>\n</body></html>',night);
                fclose(fileVIS);
            end    
        else
            if strcmp(banner,'applet')
                % Sfondo bianco e scritta nera  
                fileVIS = fopen([cartella_res 'visibility.txt'],'w');
                fprintf(fileVIS,'%s; ./ ; 16777215 ; 0 ; Arial ; 20 ; test',night);
                fclose(fileVIS);
             else
                % Sfondo nero e scritta bianca
                fileVIS = fopen([cartella_res 'visibility_value.htm'],'w');
                fprintf(fileVIS,'<html>\n<head>\n<title>Vidi values</title>\n</head>\n<body bgcolor="#FFFFFF">\n<p align="center"><b><font face="Terminal" color="#000000">');
                fprintf(fileVIS,'%s</font><br></b></p>\n</body></html>',night);
                fclose(fileVIS);
            end 
        end
    end
    %
    % File testuale con i risultati di tutte le elaborazioni della giornata
    %
    fileVISREC = fopen([cartella_res datetoday '_visibility.txt'],'a');
    fprintf(fileVISREC,'%s;%s;%s;%s;%s;%s;%s;%s;%s;%s;%s\r\n',datetime,num2str(fix(abs(rel_visibility_pearson(1)))),num2str(fix(abs(rel_visibility_pearson(2)))),num2str(fix(abs(rel_visibility_pearson(3)))),num2str(fix(abs(rel_visibility_pearson(4)))),num2str(fix(abs(rel_visibility_pearson(5)))),num2str(fix(abs(rel_visibility_pearson(6)))),num2str(fix(abs(rel_visibility_pearson(7)))),num2str(fix(abs(rel_visibility_pearson(8)))),num2str(fix(abs(rel_visibility_pearson(9)))),num2str(fix(total_rel_vis_pearson(k))));
    fclose(fileVISREC);
    %
    %save(file_cache_visibility);
    % imposto inizializzazione a 0
    inizializzazione=0;
    %
    pausa=300;
    pausa_min=pausa/60;
    %if strcmp(num2str(pausa_min),'1')==1
    if pausa_min==1
        pausa_time=strcat(['Pausa di ' num2str(pausa_min) ' minuto']);
    else
        pausa_time=strcat(['Pausa di ' num2str(pausa_min) ' minuti']);
    end
    disp(pausa_time)
    pause(pausa)
 end

