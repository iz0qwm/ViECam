%
% Carico il file delle Varibili del sito
%
ini_sito = IniConfig();
ini_sito.ReadFile('vidi_sito.ini')
%
% DEFINIZIONE VARIABILI DEL SITO
%
% Definizione delle distanze dei target
%
Target1 = ini_sito.GetValues('Sezione1', 'Target1');
Target2_1 = ini_sito.GetValues('Sezione1', 'Target2_1');
Target2_2 = ini_sito.GetValues('Sezione1', 'Target2_2');
Target3_1 = ini_sito.GetValues('Sezione1', 'Target3_1');
Target3_2 = ini_sito.GetValues('Sezione1', 'Target3_2');
Target3_3 = ini_sito.GetValues('Sezione1', 'Target3_3');
Target4_1 = ini_sito.GetValues('Sezione1', 'Target4_1');
Target4_2 = ini_sito.GetValues('Sezione1', 'Target4_2');
Target4_3 = ini_sito.GetValues('Sezione1', 'Target4_3');
%
% Intestazione: sono le lettere che identificano il luogo in cui è situato
% il sistema
%
intestazione = ini_sito.GetValues('Sezione1', 'intestazione');
%
% Latitudine e Longitudine in gradi decimali
%
latitude= ini_sito.GetValues('Sezione1', 'latitude');
longitude= ini_sito.GetValues('Sezione1', 'longitude');
%
% settaggio giorno/notte per evitare di salvare immagini notturne
%
GMT = ini_sito.GetValues('Sezione1', 'GMT');
%
% Immagine corrente
%
immagine_corrente = ini_sito.GetValues('Sezione1', 'immagine_corrente');
%
% Sfondo della pagina Web. Questa impostazione modifica il file
% visibility.txt da inviare sul sito Web. Valori possibili: nero o bianco
%
sfondo = ini_sito.GetValues('Sezione1', 'sfondo');
%
% Tipo banner web su cui inviare il valore di visibilità. Valori possibili:
% applet o testo
%
banner = ini_sito.GetValues('Sezione1', 'banner');
%
% Controllo tempo presente
%
check_tempopresente = ini_sito.GetValues('Sezione1', 'check_tempopresente');
%
% Coordinate del cielo nell'immagine di riferimento
%
coord_cielo_x_vertice = ini_sito.GetValues('Sezione1', 'coord_cielo_x_vertice');
coord_cielo_y_vertice = ini_sito.GetValues('Sezione1', 'coord_cielo_y_vertice'); 
coord_cielo_larghezza = ini_sito.GetValues('Sezione1', 'coord_cielo_larghezza');
coord_cielo_altezza = ini_sito.GetValues('Sezione1', 'coord_cielo_altezza');
%
% Controllo offuscamento target
%
check_offuscamento = ini_sito.GetValues('Sezione1', 'check_offuscamento');
%
% Coordinate del target1
%
coord_target1_x_vertice = ini_sito.GetValues('Sezione1', 'coord_target1_x_vertice');
coord_target1_y_vertice = ini_sito.GetValues('Sezione1', 'coord_target1_y_vertice'); 
coord_target1_larghezza = ini_sito.GetValues('Sezione1', 'coord_target1_larghezza');
coord_target1_altezza = ini_sito.GetValues('Sezione1', 'coord_target1_altezza');
%
% Coordinate del target2
%
coord_target2_x_vertice = ini_sito.GetValues('Sezione1', 'coord_target2_x_vertice');
coord_target2_y_vertice = ini_sito.GetValues('Sezione1', 'coord_target2_y_vertice'); 
coord_target2_larghezza = ini_sito.GetValues('Sezione1', 'coord_target2_larghezza');
coord_target2_altezza = ini_sito.GetValues('Sezione1', 'coord_target2_altezza');
%
% Coordinate del target3
%
coord_target3_x_vertice = ini_sito.GetValues('Sezione1', 'coord_target3_x_vertice');
coord_target3_y_vertice = ini_sito.GetValues('Sezione1', 'coord_target3_y_vertice'); 
coord_target3_larghezza = ini_sito.GetValues('Sezione1', 'coord_target3_larghezza');
coord_target3_altezza = ini_sito.GetValues('Sezione1', 'coord_target3_altezza');
%
% Coordinate del target4
%
coord_target4_x_vertice = ini_sito.GetValues('Sezione1', 'coord_target4_x_vertice');
coord_target4_y_vertice = ini_sito.GetValues('Sezione1', 'coord_target4_y_vertice'); 
coord_target4_larghezza = ini_sito.GetValues('Sezione1', 'coord_target4_larghezza');
coord_target4_altezza = ini_sito.GetValues('Sezione1', 'coord_target4_altezza');
%
%
% FINE: DEFINIZIONE VARIABILI DEL SITO
%
%
cartella=['C:\VIDI\' intestazione 'Cam\']; %viene dichiarata la cartella in cui si trovano le immagini
cartella_res='C:\VIDI\DATA\'; 
cartella_daily='C:\VIDI\DATA\DAILY\';
data_inizio='2012-10-25';%il primo giorno farà l'inizializzazione
data_fine='2012-10-27';
ora_inizio='01:00:00';%viene indicato l'intervallo temporale in cui eseguire l'inizializzazione
ora_fine='23:55:00';

%
visibility_old='';
lista_immagini=dir(strcat(cartella,'*.jpg'));%viene acquisito l'elenco di immagini presenti nella cartella
im_rif_col=imread('C:\VIDI\Maschere\riferimento.jpg');%l'immagine nitida di partenza viene convertita
im_rif=RGB2EDGE(im_rif_col); %da RGB a una nuova immagine di riferimento di soli bordi
%
%