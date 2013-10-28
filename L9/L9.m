function varargout = L9(varargin)
% L9 MATLAB code for L9.fig
%      L9, by itself, creates a new L9 or raises the existing
%      singleton*.
%
%      H = L9 returns the handle to a new L9 or the handle to
%      the existing singleton*.
%
%      L9('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in L9.M with the given input arguments.
%
%      L9('Property','Value',...) creates a new L9 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before L9_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to L9_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help L9

% Last Modified by GUIDE v2.5 27-Oct-2013 21:51:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @L9_OpeningFcn, ...
                   'gui_OutputFcn',  @L9_OutputFcn, ...
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


% --- Executes just before L9 is made visible.
function L9_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to L9 (see VARARGIN)

% Choose default command line output for L9
handles.output = hObject;
%functext - строковое представление функции
%a - начало интервала
%b - конец интервала
%N - число итераций
%eps - эпсилон
%x0 - начальное приближение
handles.functext='';
handles.a = -1;
handles.b = 1;
handles.N = 20;
handles.eps = 0.001;
handles.x0 = 2;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes L9 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = L9_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
handles.functext = get(hObject, 'String');
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Получим строковое представление функции
functext=handles.functext;
%Установим a b N eps
x=handles.a:0.01:handles.b;
%Получим указатели на функции 
[f,f1]=makeFunction(functext);
[~,temp]=f1(0);
temp=char(temp);
set(handles.texty1,'String',['dy/dx= ' temp]);
set(handles.texty,'String',['y= ' functext]);
%В зависимости от выбора получаем результирующую точку и название метода
switch get(get(handles.uipanel1,'SelectedObject'),'Tag')
                case 'FibBut',  [xRes,yRes,sMethod]=FibMinNum(f,handles.a,handles.b,handles.N);
                case 'GoldStahBut',  [xRes,yRes,sMethod]=GoldStash(f,handles.a,handles.b,handles.eps);
                case 'FastFallBut',  [xRes,yRes,sMethod]=FastFall(f,f1,handles.x0,handles.eps);
                otherwise, [xRes,yRes,sMethod]=FibMinNum(f,handles.a,handles.b,handles.N);
end

set(handles.text1,'String',['x = ' num2str(xRes) '  y = ' num2str(yRes) ' Method = ' sMethod] );
axes(handles.axes1),plot(x,f(x),'g-',xRes,yRes,'ro');
axes(handles.axes2),plot(x,f1(x),'b-',xRes,f1(xRes),'ro');
guidata(hObject, handles);



function edita_Callback(hObject, eventdata, handles)
% hObject    handle to edita (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edita as text
%        str2double(get(hObject,'String')) returns contents of edita as a double
handles.a = str2double(get(hObject,'string'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edita_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edita (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editb_Callback(hObject, eventdata, handles)
% hObject    handle to editb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editb as text
%        str2double(get(hObject,'String')) returns contents of editb as a double
handles.b = str2double(get(hObject,'string'));
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function editb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editN_Callback(hObject, eventdata, handles)
% hObject    handle to editN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editN as text
%        str2double(get(hObject,'String')) returns contents of editN as a double
handles.N = str2double(get(hObject,'string'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function editN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editeps_Callback(hObject, eventdata, handles)
% hObject    handle to editeps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editeps as text
%        str2double(get(hObject,'String')) returns contents of editeps as a double
handles.eps = str2double(get(hObject,'string'));
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function editeps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editeps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on FibBut and none of its controls.




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over FibBut.
function FibBut_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to FibBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles=guidata(hObject);
handles.method=1;
guidata(hObject, handles);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over GoldStahBut.
function GoldStahBut_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to GoldStahBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.method=2;
guidata(hObject, handles);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over FastFallBut.
function FastFallBut_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to FastFallBut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.method=3;
guidata(hObject, handles);



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.x0 = str2double(get(hObject,'string'));
guidata(hObject, handles);
