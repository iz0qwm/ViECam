%
% Variabili delle date
%
%
% Carico il file delle Varibili del sito
%
%carica_config_sito
%
%datesave = datestr(now,'YYYY-mm-dd_HH-MM-SS');
datesave = datestr(now,'YYmmddHHMMSS');
datetoday = datestr(now,'YYmmdd');
datetime = datestr(now,'HHMMSS');
%
% Controllo del giorno e della notte
%
[SunRiseSet,Day,Dec,Alt,Azm,Rad] = suncycle(latitude,longitude);
[hour_sunrise,min_sunrise,secs_sunrise]=h2hms(SunRiseSet(1)+1);
[hour_sunset,min_sunset,secs_sunset]=h2hms(SunRiseSet(2)+1);
%
giorno=[num2str(hour_sunrise) ':' num2str(min_sunrise) ':' num2str(secs_sunrise)];
notte=[num2str(hour_sunset) ':' num2str(min_sunset) ':' num2str(secs_sunset)];
%
%Esempio giorno=07:15:00
%Esempio notte=16:00:00
%
% variabili per evitare la scrittura notturna delle immagini
%
dataoggi = datestr(now,'YYYY-mm-dd');
adesso = datestr(now,'HH:MM:SS');
data_ora_notte = datenum([dataoggi ' ' notte]);
data_ora_giorno = datenum([dataoggi ' ' giorno]);
data_ora_adesso = datenum([dataoggi ' ' adesso]);
%