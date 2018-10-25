%
% funzione per la ricerca della copertura nuvolosa
%
function [tempopresente]=copertura_nuvolosa_VDV(sommacountBlue,sommacountWhite,sommacountGrey,sommacountAll,contrasto_medio)

if sommacountBlue > 400
    if (sommacountBlue >9000 && sommacountGrey < 8000)
        %
        % Sunny Sky (Sereno)    
        %
        tempopresente='Sunny Sky';
    elseif (sommacountBlue > 7500)
        %
        % Clear Sky (Sereno e meno del 30% nuvoloso)
        %
        tempopresente='Clear Sky';
    elseif (sommacountBlue > 3700 && sommacountGrey < 8000)
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
    if (sommacountGrey > 10000 && contrasto_medio < 0.1 && contrasto_medio > 0.05)
    %
    % Overcast (molto nuvoloso e copertura nuvolosa del 90%)
    %
    tempopresente='Broken clouds';
    elseif (sommacountGrey > 8000 && contrasto_medio < 0.6 && contrasto_medio > 0.1)
    %
    % Raining (Pioggia e copertura nuvolosa del 100%)
    %
    tempopresente='Overcast';
    elseif (sommacountGrey > 11200 && contrasto_medio <= 0.015)
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
