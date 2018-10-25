    %
    % Carico il file degli algoritmi
    %    
    %
    ini_algoritmi = IniConfig();
    ini_algoritmi.ReadFile('vidi_algoritmi.ini')    
    %
    % Carico i valori di offset e gain
    %
    tollerance_comparison=ini_algoritmi.GetValues('comparison', 'tollerance_comparison');
    %
    gain_vismax=ini_algoritmi.GetValues('vismax', 'gain_vismax');
    off_vismax_max=ini_algoritmi.GetValues('vismax', 'off_vismax_max');
    %
    gain_visgood=ini_algoritmi.GetValues('visgood', 'gain_visgood');
    off_visgood_max=ini_algoritmi.GetValues('visgood', 'off_visgood_max');
    %
    gain_viscover=ini_algoritmi.GetValues('viscover', 'gain_viscover');
    off_viscover_max=ini_algoritmi.GetValues('viscover', 'off_viscover_max');
    %
    gain_visallfog=ini_algoritmi.GetValues('visallfog', 'gain_visallfog');
    off_visallfog_max=ini_algoritmi.GetValues('visallfog', 'off_visallfog_max');
    %
    gain_visfog=ini_algoritmi.GetValues('visfog', 'gain_visfog');
    off_visfog_max=ini_algoritmi.GetValues('visfog', 'off_visfog_max');
    %
    gain_vismist=ini_algoritmi.GetValues('vismist', 'gain_vismist');
    off_vismist_max=ini_algoritmi.GetValues('vismist', 'off_vismist_max');
    %
    lowBlueR=ini_algoritmi.GetValues('coloricielo', 'lowBlueR');
    highBlueR=ini_algoritmi.GetValues('coloricielo', 'highBlueR');  
    lowBlueG=ini_algoritmi.GetValues('coloricielo', 'lowBlueG');
    highBlueG=ini_algoritmi.GetValues('coloricielo', 'highBlueG');
    lowBlueB=ini_algoritmi.GetValues('coloricielo', 'lowBlueB');
    highBlueB=ini_algoritmi.GetValues('coloricielo', 'highBlueB');
    %
    lowWhiteR=ini_algoritmi.GetValues('coloricielo', 'lowWhiteR');
    highWhiteR=ini_algoritmi.GetValues('coloricielo', 'highWhiteR');  
    lowWhiteG=ini_algoritmi.GetValues('coloricielo', 'lowWhiteG');
    highWhiteG=ini_algoritmi.GetValues('coloricielo', 'highWhiteG');
    lowWhiteB=ini_algoritmi.GetValues('coloricielo', 'lowWhiteB');
    highWhiteB=ini_algoritmi.GetValues('coloricielo', 'highWhiteB');
    %
    sunny_sky_gain_vismax=ini_algoritmi.GetValues('tempopresente', 'sunny_sky_gain_vismax');
    sunny_sky_gain_visgood=ini_algoritmi.GetValues('tempopresente', 'sunny_sky_gain_visgood');
    %
    clear_sky_gain_vismax=ini_algoritmi.GetValues('tempopresente', 'clear_sky_gain_vismax');
    clear_sky_gain_visgood=ini_algoritmi.GetValues('tempopresente', 'clear_sky_gain_visgood');
    %
    partly_cloudy_gain_vismax=ini_algoritmi.GetValues('tempopresente', 'partly_cloudy_gain_vismax');
    partly_cloudy_gain_visgood=ini_algoritmi.GetValues('tempopresente', 'partly_cloudy_gain_visgood');
    partly_cloudy_gain_viscover=ini_algoritmi.GetValues('tempopresente', 'partly_cloudy_gain_viscover');
    %
    cloudy_gain_vismist=ini_algoritmi.GetValues('tempopresente', 'cloudy_gain_vismist');
    cloudy_gain_viscover=ini_algoritmi.GetValues('tempopresente', 'cloudy_gain_viscover');
    cloudy_gain_visgood=ini_algoritmi.GetValues('tempopresente', 'cloudy_gain_visgood');
    cloudy_gain_vismax=ini_algoritmi.GetValues('tempopresente', 'cloudy_gain_vismax');    
    %
    broken_clouds_gain_vismax=ini_algoritmi.GetValues('tempopresente', 'broken_clouds_gain_vismax');
    broken_clouds_gain_visgood=ini_algoritmi.GetValues('tempopresente', 'broken_clouds_gain_visgood');
    broken_clouds_gain_viscover=ini_algoritmi.GetValues('tempopresente', 'broken_clouds_gain_viscover');
    broken_clouds_gain_vismist=ini_algoritmi.GetValues('tempopresente', 'broken_clouds_gain_vismist');
    %
    overcast_gain_visgood=ini_algoritmi.GetValues('tempopresente', 'overcast_gain_visgood');
    overcast_gain_viscover=ini_algoritmi.GetValues('tempopresente', 'overcast_gain_viscover');
    overcast_gain_vismist=ini_algoritmi.GetValues('tempopresente', 'overcast_gain_vismist');
    %
    fog_gain_vismist=ini_algoritmi.GetValues('tempopresente', 'fog_gain_vismist');
    fog_gain_visallfog=ini_algoritmi.GetValues('tempopresente', 'fog_gain_visallfog');
    fog_gain_visfog=ini_algoritmi.GetValues('tempopresente', 'fog_gain_visfog');
    %
    mist_gain_viscover=ini_algoritmi.GetValues('tempopresente', 'mist_gain_viscover');
    mist_gain_visgood=ini_algoritmi.GetValues('tempopresente', 'mist_gain_visgood');
    mist_gain_vismist=ini_algoritmi.GetValues('tempopresente', 'mist_gain_vismist');
    mist_gain_visfog=ini_algoritmi.GetValues('tempopresente', 'mist_gain_visfog');
    %
    err_max_target1=ini_algoritmi.GetValues('checktarget', 'err_max_target1');
    err_max_target2=ini_algoritmi.GetValues('checktarget', 'err_max_target2');
    err_max_target3=ini_algoritmi.GetValues('checktarget', 'err_max_target3');
    err_max_target4=ini_algoritmi.GetValues('checktarget', 'err_max_target4');
    %
    
    