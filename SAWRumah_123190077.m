function varargout = SAWRumah_123190077(varargin)
% SAWRUMAH_123190077 MATLAB code for SAWRumah_123190077.fig
%      SAWRUMAH_123190077, by itself, creates a new SAWRUMAH_123190077 or raises the existing
%      singleton*.
%
%      H = SAWRUMAH_123190077 returns the handle to a new SAWRUMAH_123190077 or the handle to
%      the existing singleton*.
%
%      SAWRUMAH_123190077('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAWRUMAH_123190077.M with the given input arguments.
%
%      SAWRUMAH_123190077('Property','Value',...) creates a new SAWRUMAH_123190077 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SAWRumah_123190077_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SAWRumah_123190077_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SAWRumah_123190077

% Last Modified by GUIDE v2.5 23-Jun-2021 19:02:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SAWRumah_123190077_OpeningFcn, ...
                   'gui_OutputFcn',  @SAWRumah_123190077_OutputFcn, ...
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


% --- Executes just before SAWRumah_123190077 is made visible.
function SAWRumah_123190077_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SAWRumah_123190077 (see VARARGIN)

% Choose default command line output for SAWRumah_123190077
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SAWRumah_123190077 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SAWRumah_123190077_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_hitung.
function btn_hitung_Callback(hObject, eventdata, handles)
% hObject    handle to btn_hitung (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=[ 2,3,2,2,1;
    2,2,3,4,2;
    1,1,2,1,2;
    4,3,1,2,3;
    3,2,3,3,3];
set(handles.tb_nk,'Data',x);
k=[0,1,1,0,1];%nilai atribut, dimana 0= atribut cost &1= atribut benefit
w = handles.bobot;
rumah = {'Perumahan Indah' 'Griya Ambarrukmo' 'Perumahan Babarsari' 'Perumahan Permai' 'Nologaten Residence'};
[m,n]=size (x);
R=zeros (m,n);
Y=zeros (m,n);
for j=1:n
 if k(j)==1 %statement untuk kriteria dengan atribut keuntungan
    R(:,j)=x(:,j)./max(x(:,j));
 else
    R(:,j)=min(x(:,j))./x(:,j);
 end
end
%proses perangkingan
for i=1:m
    V(i)= sum(w.*R(i,:));
end
[rank,rowRank] = sort(V,'descend');
[cons,rowCons] = max(V);
set(handles.tb_hasil,'Data',V);
set(handles.tb_rank,'Data',rumah(rowRank));
set(handles.st_textkesimpulan, 'String', "Rekomendasi Rumah Terbaik : ");
set(handles.st_kesimpulan, 'String', rumah(rowCons));


% --- Executes on button press in btn_tampilSanitasi.
function btn_tampilSanitasi_Callback(hObject, eventdata, handles)
% hObject    handle to btn_tampilSanitasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.img_sanitasi);
imshow(imread('kritSanitasi.png'));

% --- Executes on button press in btn_tampilKeamanan.
function btn_tampilKeamanan_Callback(hObject, eventdata, handles)
% hObject    handle to btn_tampilKeamanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.img_keamanan);
imshow(imread('kritKeamanan.png'));

% --- Executes on button press in btn_tampilHarga.
function btn_tampilHarga_Callback(hObject, eventdata, handles)
% hObject    handle to btn_tampilHarga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.img_harga);
imshow(imread('kritHarga.png'));

% --- Executes on button press in btn_tampilKondisi.
function btn_tampilKondisi_Callback(hObject, eventdata, handles)
% hObject    handle to btn_tampilKondisi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.img_kondisi);
imshow(imread('kritKondisi.png'));

% --- Executes on button press in btn_tampilStrategis.
function btn_tampilStrategis_Callback(hObject, eventdata, handles)
% hObject    handle to btn_tampilStrategis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.img_strategis);
imshow(imread('kritStrategis.png'));


% --- Executes on button press in btn_simpan.
function btn_simpan_Callback(hObject, eventdata, handles)
% hObject    handle to btn_simpan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bobotHandle = [
    handles.et_strategis, 
    handles.et_kondisi,
    handles.et_sanitasi,
    handles.et_harga,
    handles.et_keamanan
    ];
for i=1:size(bobotHandle)
    handles.bobot(i) = str2double(get(bobotHandle(i),'String'));
end
guidata(hObject, handles);


function et_strategis_Callback(hObject, eventdata, handles)
% hObject    handle to et_strategis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_strategis as text
%        str2double(get(hObject,'String')) returns contents of et_strategis as a double


% --- Executes during object creation, after setting all properties.
function et_strategis_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_strategis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function et_kondisi_Callback(hObject, eventdata, handles)
% hObject    handle to et_kondisi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_kondisi as text
%        str2double(get(hObject,'String')) returns contents of et_kondisi as a double


% --- Executes during object creation, after setting all properties.
function et_kondisi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_kondisi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function et_sanitasi_Callback(hObject, eventdata, handles)
% hObject    handle to et_sanitasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_sanitasi as text
%        str2double(get(hObject,'String')) returns contents of et_sanitasi as a double


% --- Executes during object creation, after setting all properties.
function et_sanitasi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_sanitasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function et_harga_Callback(hObject, eventdata, handles)
% hObject    handle to et_harga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_harga as text
%        str2double(get(hObject,'String')) returns contents of et_harga as a double


% --- Executes during object creation, after setting all properties.
function et_harga_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_harga (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function et_keamanan_Callback(hObject, eventdata, handles)
% hObject    handle to et_keamanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of et_keamanan as text
%        str2double(get(hObject,'String')) returns contents of et_keamanan as a double


% --- Executes during object creation, after setting all properties.
function et_keamanan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to et_keamanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
