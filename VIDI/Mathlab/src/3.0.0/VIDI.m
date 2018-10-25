function varargout = VIDI(varargin)
% VIDI M-file for VIDI.fig
%      VIDI, by itself, creates a new VIDI or raises the existing
%      singleton*.
%
%      H = VIDI returns the handle to a new VIDI or the handle to
%      the existing singleton*.
%
%      VIDI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIDI.M with the given input arguments.
%
%      VIDI('Property','Value',...) creates a new VIDI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VIDI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VIDI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VIDI

% Last Modified by GUIDE v2.5 16-Nov-2012 12:20:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VIDI_OpeningFcn, ...
                   'gui_OutputFcn',  @VIDI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


function [immagine]=immagine_current
%
% Carico la configurazione del sito
%
carica_config_sito
%
% impostazione varibili delle date
%
variabili_date
%
% Cerca il nome immagine nella directory
findfile = dir(fullfile(cartella_res,[intestazione '_Vis*.jpg']));
immagine = findfile(1).name;

    
% --- Executes just before VIDI is made visible.
function VIDI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VIDI (see VARARGIN)
%
% Carico la configurazione del sito
%
carica_config_sito
%
% impostazione varibili delle date
%
variabili_date
%
% Svuoto il campo manual_visibility
set(handles.manual_visibility,'String','');

%Ciclo per controllare ogni 60sec la nuova immagine
while 1

    % Choose default command line output for VIDI
    handles.output = hObject;

    % Cerca il nome immagine nella directory
    immagine = immagine_current;
    %disp(immagine)
    %
    %findfile = dir(fullfile(cartella_res,[intestazione '_Vis*.jpg']));
    %immagine = findfile(1).name;
    %disp(immagine)
    [immagine_prima,immagine_dopo]=strtok(immagine,'_');
    %disp(immagine_dopo)
    immagine_dopo=immagine_dopo(5:end);
    %disp(immagine_dopo)
    [immagine_seconda1,immagine_seconda2]=strtok(immagine_dopo,'.');
    immagine_seconda=immagine_seconda1;
    %disp(immagine_seconda)

    % Leggo l'immagine current già elaborata da VIDI.exe
    imageCurrent=imread([cartella_res intestazione '_Vis' immagine_seconda '.jpg']);
    % Switch active axes to the one you made for the image.
    axes(handles.current);
    % Put the image array into the axes so it will appear on the GUI
    imshow(imageCurrent);

    % Leggo l'immagine degli edges current_edge già elaborata da VIDI.exe
    imageCurrentEdge=imread([cartella_res intestazione '_' immagine_seconda '_edge.jpg']);
    % Switch active axes to the one you made for the image.
    axes(handles.current_edge);
    % Put the image array into the axes so it will appear on the GUI
    imshow(imageCurrentEdge);

    % Scrivo il valore della visibilità nel campo testo nero
    set(handles.auto_visibility,'String',[immagine_seconda ' m']);
    
    % Update handles structure
    guidata(hObject, handles);

    % Refresh ogni 60 secondi
    pause(60)
    
end
% UIWAIT makes VIDI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = VIDI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function manual_visibility_Callback(hObject, eventdata, handles)
% hObject    handle to manual_visibility (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of manual_visibility as text
%        str2double(get(hObject,'String')) returns contents of manual_visibility as a double


% --- Executes during object creation, after setting all properties.
function manual_visibility_CreateFcn(hObject, eventdata, handles)
% hObject    handle to manual_visibility (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OK.
function OK_Callback(hObject, eventdata, handles)
% hObject    handle to OK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
immetti_dato(handles)

    
function immetti_dato(handles)
%
% Carico la configurazione del sito
%
carica_config_sito
%
% impostazione varibili delle date
%
variabili_date
%
% Cerca il nome immagine nella directory
immagine=immagine_current;
%
%Salvo il dato immesso in manual_visibility
handles.dato.manual_visibility = str2double(get(handles.manual_visibility,'String'));
%
% Svuoto il campo manual_visibility
set(handles.manual_visibility,'String','');
%
% File testuale con i risultati della giornata per creare il
% grafico su pagina Web
%
fileVISREPORT = fopen([cartella_res datetoday '_report.txt'],'a');
fprintf(fileVISREPORT,'%s;%s;%s\r\n',datetime,immagine,num2str(handles.dato.manual_visibility));
fclose(fileVISREPORT);


