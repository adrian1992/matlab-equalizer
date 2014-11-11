function varargout = main_gui(varargin)
% MAIN_GUI MATLAB code for main_gui.fig
%      MAIN_GUI, by itself, creates a new MAIN_GUI or raises the existing
%      singleton*.
%
%      H = MAIN_GUI returns the handle to a new MAIN_GUI or the handle to
%      the existing singleton*.
%
%      MAIN_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_GUI.M with the given input arguments.
%
%      MAIN_GUI('Property','Value',...) creates a new MAIN_GUI or raises the
%      existing singleton*.  Starting from the left, property Value pairs are
%      applied to the GUI before main_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid Value makes property application
%      stop.  All inputs are passed to main_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_gui

% Last Modified by GUIDE v2.5 07-Nov-2014 12:49:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @main_gui_OutputFcn, ...
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


% --- Executes just before main_gui is made visible.
function main_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_gui (see VARARGIN)

% Choose default command line output for main_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbuttondial.
function pushbuttondial_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttondial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear x N f fs nbits
global x N f fs nbits;
load cadena_dial.mat
x = resample(dial,16,1)';
L = length(x);
N = 2^nextpow2(L);
f = linspace(-fs/2,fs/2,N);
nbits = nbits;


% --- Executes on button press in pushbuttonm80.
function pushbuttonm80_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonm80 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear x N f fs nbits
global x N f fs nbits;
load cadena_m80.mat
x = resample(m80,16,1)';
L = length(x);
N = 2^nextpow2(L);
f = linspace(-fs/2,fs/2,N);


% --- Executes on button press in pushbuttonresetgains.
function pushbuttonresetgains_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonresetgains (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global defaultgainlowpass defaultgainbandpass1 defaultgainbandpass2 defaultgainbandpass3 defaultgainbandpass4 defaultgainhighpass;
global gainlowpass gainbandpass1 gainbandpass2 gainbandpass3 gainbandpass4 gainhighpass;
gainlowpass = defaultgainlowpass;
set(handles.sliderlowpass,'Value',gainlowpass);
set(handles.textlowpass,'String',['Gain ' num2str(gainlowpass, 3) 'dB'])
gainbandpass1 = defaultgainbandpass1;
set(handles.sliderbandpass1,'Value',gainbandpass1);
set(handles.textbandpass1,'String',['Gain ' num2str(gainbandpass1, 3) 'dB'])
gainbandpass2 = defaultgainbandpass2;
set(handles.sliderbandpass2,'Value',gainbandpass2);
set(handles.textbandpass2,'String',['Gain ' num2str(gainbandpass2, 3) 'dB'])
gainbandpass3 = defaultgainbandpass3;
set(handles.sliderbandpass3,'Value',gainbandpass3);
set(handles.textbandpass3,'String',['Gain ' num2str(gainbandpass3, 3) 'dB'])
gainbandpass4 = defaultgainbandpass4;
set(handles.sliderbandpass4,'Value',gainbandpass4);
set(handles.textbandpass4,'String',['Gain ' num2str(gainbandpass4, 3) 'dB'])
gainhighpass = defaultgainhighpass;
set(handles.sliderhighpass,'Value',gainhighpass);
set(handles.texthighpass,'String',['Gain ' num2str(gainhighpass, 3) 'dB'])

% --- Executes on button press in pushbuttonsetdefault.
function pushbuttonsetdefault_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonsetdefault (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global defaultgainlowpass defaultgainbandpass1 defaultgainbandpass2 defaultgainbandpass3 defaultgainbandpass4 defaultgainhighpass;
global gainlowpass gainbandpass1 gainbandpass2 gainbandpass3 gainbandpass4 gainhighpass;
global defaultfreqlowpass defaultfreqbandpass1 defaultfreqbandpass2 defaultfreqbandpass3 defaultfreqbandpass4 defaultfreqhighpass;
global freqlowpass freqbandpass1 freqbandpass2 freqbandpass3 freqbandpass4 freqhighpass;
defaultgainlowpass = gainlowpass;
defaultgainbandpass1 = gainbandpass1;
defaultgainbandpass2 = gainbandpass2;
defaultgainbandpass3 = gainbandpass3;
defaultgainbandpass4 = gainbandpass4;
defaultgainhighpass = gainhighpass;
defaultfreqlowpass = freqlowpass;
defaultfreqbandpass1 = freqbandpass1;
defaultfreqbandpass2 = freqbandpass2;
defaultfreqbandpass3 = freqbandpass3;
defaultfreqbandpass4 = freqbandpass4;
defaultfreqhighpass = freqhighpass;


% --- Executes on button press in pushbuttonresetfreq.
function pushbuttonresetfreq_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonresetfreq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global defaultfreqlowpass defaultfreqbandpass1 defaultfreqbandpass2 defaultfreqbandpass3 defaultfreqbandpass4 defaultfreqhighpass;
global freqlowpass freqbandpass1 freqbandpass2 freqbandpass3 freqbandpass4 freqhighpass;
freqlowpass = defaultfreqlowpass;
freqbandpass1 = defaultfreqbandpass1;
freqbandpass2 = defaultfreqbandpass2;
freqbandpass3 = defaultfreqbandpass3;
freqbandpass4 = defaultfreqbandpass4;
freqhighpass = defaultfreqhighpass;

% --- Executes on button press in pushbuttonplayoriginal.
function pushbuttonplayoriginal_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonplayoriginal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x fs nbits;
sound(x,fs,nbits);


% --- Executes on button press in pushbuttonplayequalized.
function pushbuttonplayequalized_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonplayequalized (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x_eq fs nbits;
equalize();
sound(x_eq,fs,nbits);


% --- Executes on button press in pushbuttonplot.
function pushbuttonplot_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonplot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global X X_eq Filter f;
equalize();
semilogy(handles.originalsignal,f,real(X));
plot(handles.filter,f,Filter);
semilogy(handles.equalizedsignal,f,real(X_eq));


% --- Executes on slider movement.
function sliderlowpass_Callback(hObject, eventdata, handles)
% hObject    handle to sliderlowpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global gainlowpass;
gainlowpass = get(hObject,'Value');
set(handles.textlowpass,'String',sprintf('Gain %d dB',gainlowpass))

% --- Executes during object creation, after setting all properties.
function sliderlowpass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderlowpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
global defaultgainlowpass gainlowpass;
defaultgainlowpass = 0;
gainlowpass = defaultgainlowpass;


% --- Executes on slider movement.
function sliderbandpass1_Callback(hObject, eventdata, handles)
% hObject    handle to sliderbandpass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global gainbandpass1;
gainbandpass1 = get(hObject,'Value');
set(handles.textbandpass1,'String',['Gain ' num2str(gainbandpass1, 3) 'dB'])

% --- Executes during object creation, after setting all properties.
function sliderbandpass1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderbandpass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
global gainbandpass1 defaultgainbandpass1;
defaultgainbandpass1 = 0;
gainbandpass1 = defaultgainbandpass1;


% --- Executes on slider movement.
function sliderbandpass2_Callback(hObject, eventdata, handles)
% hObject    handle to sliderbandpass2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global gainbandpass2;
gainbandpass2 = get(hObject,'Value');
set(handles.textbandpass2,'String',['Gain ' num2str(gainbandpass2, 3) 'dB'])


% --- Executes during object creation, after setting all properties.
function sliderbandpass2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderbandpass2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
global gainbandpass2 defaultgainbandpass2;
defaultgainbandpass2 = 0;
gainbandpass2 = defaultgainbandpass2;


% --- Executes on slider movement.
function sliderbandpass3_Callback(hObject, eventdata, handles)
% hObject    handle to sliderbandpass3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global gainbandpass3;
gainbandpass3 = get(hObject,'Value');
set(handles.textbandpass3,'String',['Gain ' num2str(gainbandpass3, 3) 'dB'])


% --- Executes during object creation, after setting all properties.
function sliderbandpass3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderbandpass3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
global gainbandpass3 defaultgainbandpass3;
defaultgainbandpass3 = 0;
gainbandpass3 = defaultgainbandpass3;


% --- Executes on slider movement.
function sliderbandpass4_Callback(hObject, eventdata, handles)
% hObject    handle to sliderbandpass4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global gainbandpass4;
gainbandpass4 = get(hObject,'Value');
set(handles.textbandpass4,'String',['Gain ' num2str(gainbandpass4, 3) 'dB'])


% --- Executes during object creation, after setting all properties.
function sliderbandpass4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderbandpass4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
global gainbandpass4 defaultgainbandpass4;
defaultgainbandpass4 = 0;
gainbandpass4 = defaultgainbandpass4;


% --- Executes on slider movement.
function sliderhighpass_Callback(hObject, eventdata, handles)
% hObject    handle to sliderhighpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global gainhighpass;
gainhighpass = get(hObject,'Value');
set(handles.texthighpass,'String',['Gain ' num2str(gainhighpass, 3) 'dB'])


% --- Executes during object creation, after setting all properties.
function sliderhighpass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderhighpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
global gainhighpass defaultgainhighpass;
defaultgainhighpass = 0;
gainhighpass = defaultgainhighpass;



function editfreqlowpass_Callback(hObject, eventdata, handles)
% hObject    handle to editfreqlowpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editfreqlowpass as text
%        str2double(get(hObject,'String')) returns contents of editfreqlowpass as a double
global freqlowpass freqbandpass1 defaultfreqlowpass;
freqlowpass = str2double(get(hObject,'String'));
if(freqlowpass>freqbandpass1)
    freqlowpass=defaultfreqlowpass;
end


% --- Executes during object creation, after setting all properties.
function editfreqlowpass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editfreqlowpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global defaultfreqlowpass freqlowpass;
defaultfreqlowpass=str2double(get(hObject,'String'));
freqlowpass=defaultfreqlowpass;



function editfreqbandpass1_Callback(hObject, eventdata, handles)
% hObject    handle to editfreqbandpass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editfreqbandpass1 as text
%        str2double(get(hObject,'String')) returns contents of editfreqbandpass1 as a double
global freqbandpass1 freqlowpass freqbandpass2 defaultfreqbandpass1;
freqbandpass1 = str2double(get(hObject,'String'));
if(freqlowpass>freqbandpass1 || freqbandpass1>freqbandpass2)
    freqbandpass1=defaultfreqbandpass1;
end

% --- Executes during object creation, after setting all properties.
function editfreqbandpass1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editfreqbandpass1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global defaultfreqbandpass1 freqbandpass1;
defaultfreqbandpass1=str2double(get(hObject,'String'));
freqbandpass1=defaultfreqbandpass1;


function editfreqbandpass2_Callback(hObject, eventdata, handles)
% hObject    handle to editfreqbandpass2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editfreqbandpass2 as text
%        str2double(get(hObject,'String')) returns contents of editfreqbandpass2 as a double
global freqbandpass2 freqbandpass1 freqbandpass3 defaultfreqbandpass2;
freqbandpass2 = str2double(get(hObject,'String'));
if(freqbandpass1>freqbandpass2 || freqbandpass2>freqbandpass3)
    freqbandpass2=defaultfreqbandpass2;
end

% --- Executes during object creation, after setting all properties.
function editfreqbandpass2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editfreqbandpass2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global defaultfreqbandpass2 freqbandpass2;
defaultfreqbandpass2=str2double(get(hObject,'String'));
freqbandpass2=defaultfreqbandpass2;



function editfreqbandpass3_Callback(hObject, eventdata, handles)
% hObject    handle to editfreqbandpass3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editfreqbandpass3 as text
%        str2double(get(hObject,'String')) returns contents of editfreqbandpass3 as a double
global freqbandpass3 freqbandpass2 freqbandpass4 defaultfreqbandpass3;
freqbandpass3 = str2double(get(hObject,'String'));
if(freqbandpass2>freqbandpass3 || freqbandpass3>freqbandpass4)
    freqbandpass3=defaultfreqbandpass3;
end

% --- Executes during object creation, after setting all properties.
function editfreqbandpass3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editfreqbandpass3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global defaultfreqbandpass3 freqbandpass3;
defaultfreqbandpass3=str2double(get(hObject,'String'));
freqbandpass3=defaultfreqbandpass3;


function editfreqbandpass4_Callback(hObject, eventdata, handles)
% hObject    handle to editfreqbandpass4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editfreqbandpass4 as text
%        str2double(get(hObject,'String')) returns contents of editfreqbandpass4 as a double
global freqbandpass4 freqbandpass3 freqhighpass defaultfreqbandpass4;
freqbandpass4 = str2double(get(hObject,'String'));
if(freqbandpass3>freqbandpass4 || freqbandpass4>freqhighpass)
    freqbandpass4=defaultfreqbandpass4;
end

% --- Executes during object creation, after setting all properties.
function editfreqbandpass4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editfreqbandpass4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global defaultfreqbandpass4 freqbandpass4;
defaultfreqbandpass4=str2double(get(hObject,'String'));
freqbandpass4=defaultfreqbandpass4;


function editfreqhighpass_Callback(hObject, eventdata, handles)
% hObject    handle to editfreqhighpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editfreqhighpass as text
%        str2double(get(hObject,'String')) returns contents of editfreqhighpass as a double
global freqhighpass freqbandpass4 defaultfreqhighpass;
freqhighpass = str2double(get(hObject,'String'));
if(freqhighpass<freqbandpass4)
    freqhighpass=defaultfreqhighpass;
end

% --- Executes during object creation, after setting all properties.
function editfreqhighpass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editfreqhighpass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
global defaultfreqhighpass freqhighpass;
defaultfreqhighpass=str2double(get(hObject,'String'));
freqhighpass=defaultfreqhighpass;

function equalize()
global X N Filter X_eq x_eq x;
X = fftshift(fft(x,N));
create_filter();
X_eq = X.*Filter;
x_eq= ifft(ifftshift(X_eq));


function create_filter()
global N f;
global Filter freqlowpass freqbandpass1 freqbandpass2 freqbandpass3 freqbandpass4 freqhighpass;
global gainlowpass gainbandpass1 gainbandpass2 gainbandpass3 gainbandpass4 gainhighpass;
    Filter = ones(1,N);
    Filter(abs(f)<0 & abs(f)>freqlowpass) = 10^(gainlowpass/20);
    Filter(abs(f)<freqlowpass & abs(f)>freqbandpass1) = 10^(gainbandpass1/20);
    Filter(abs(f)<freqbandpass1 & abs(f)>freqbandpass2) = 10^(gainbandpass2/20);
    Filter(abs(f)<freqbandpass2 & abs(f)>freqbandpass3) = 10^(gainbandpass3/20);
    Filter(abs(f)<freqbandpass3 & abs(f)>freqbandpass4) = 10^(gainbandpass4/20);
    Filter(abs(f)<freqbandpass4 & abs(f)>freqhighpass) = 10^(gainhighpass/20);
    

