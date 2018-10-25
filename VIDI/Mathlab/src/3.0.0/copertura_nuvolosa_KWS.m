%
% funzione per la ricerca della copertura nuvolosa
%
function [tempopresente]=copertura_nuvolosa_KWS(sommacountBlue,sommacountWhite,sommacountGrey,sommacountAll,contrasto_medio)

if sommacountBlue > 10
    if (sommacountBlue > 10000 && sommacountWhite < 50 && sommacountGrey == 0) || (sommacountBlue > 10000 && sommacountGrey < 50 && sommacountWhite==0)
        %
        % Sunny Sky (Sereno)
        %
        tempopresente='Sunny Sky';
    elseif (sommacountBlue > 5000 && sommacountWhite < 290 && sommacountWhite > 0) || (sommacountBlue > 5000 && sommacountGrey < 290 && sommacountGrey > 0)
        %
        % Clear Sky (Sereno e meno del 30% nuvoloso)
        %
        tempopresente='Clear Sky';
    elseif (sommacountBlue > 5000 && sommacountWhite < 3015 && sommacountWhite > 0) || (sommacountBlue > 1000 && sommacountGrey < 3015 && sommacountGrey > 0)
        %
        % Partly Cloudy (Parzialmente nuvoloso e tra il 30% e il 70% nuvoloso)
        %
        tempopresente='Partly cloudy';
    else
        %
        % Cloudy (nuvoloso e più del 70% nuvoloso)
        %
        tempopresente='Cloudy';
    end
else
    if (sommacountGrey > 4500 && contrasto_medio < 0.150 && contrasto_medio > 0.040 && sommacountGrey < 20000)
    %
    % Overcast (molto nuvoloso e copertura nuvolosa del 90%)
    %
    tempopresente='Broken clouds';
    elseif (sommacountGrey > 5000 && contrasto_medio < 0.320 && contrasto_medio > 0.150 && sommacountGrey < 19000) || (sommacountGrey > 13000 && contrasto_medio > 0.020 && contrasto_medio < 0.040 && sommacountGrey < 19000)
    %
    % Raining (Pioggia e copertura nuvolosa del 100%)
    %
    tempopresente='Overcast';
    elseif (sommacountGrey > 20150 && contrasto_medio < 0.280 && contrasto_medio > 0.170)
    %
    % Fog (nebbia)
    %
    tempopresente='Fog';
    else
    %
    % Mist (foschia)
    %
    tempopresente='Mist';
    end
end
