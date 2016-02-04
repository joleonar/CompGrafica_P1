function varargout = Prueba_guide(varargin)
% PRUEBA_GUIDE MATLAB code for Prueba_guide.fig
%      PRUEBA_GUIDE, by itself, creates a new PRUEBA_GUIDE or raises the existing
%      singleton*.
%
%      H = PRUEBA_GUIDE returns the handle to a new PRUEBA_GUIDE or the handle to
%      the existing singleton*.
%
%      PRUEBA_GUIDE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRUEBA_GUIDE.M with the given input arguments.
%
%      PRUEBA_GUIDE('Property','Value',...) creates a new PRUEBA_GUIDE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Prueba_guide_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Prueba_guide_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Prueba_guide

% Last Modified by GUIDE v2.5 03-Feb-2016 12:43:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Prueba_guide_OpeningFcn, ...
                   'gui_OutputFcn',  @Prueba_guide_OutputFcn, ...
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


% --- Executes just before Prueba_guide is made visible.
function Prueba_guide_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Prueba_guide (see VARARGIN)

% Choose default command line output for Prueba_guide

handles.output = hObject;
handles.C = [];
handles.F = [];
handles.np = []; % curva seleccionada

set(hObject,'WindowButtonDownFcn',{@my_MouseClickFcn,hObject});
set(hObject,'WindowButtonUpFcn',{@my_MouseReleaseFcn,hObject});

% primitiva
handles.primitiva_n = struct('marcas',[],'pixel',[]);




% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Prueba_guide wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Prueba_guide_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Extrae informacion de los objetos radiobuttom and checkbox
%clear all

primi = get(handles.seleprimi,'SelectedObject');
curva = get(primi,'Tag');
rell = get(handles.checkrell,'Value');
npTxt = get(handles.controlPoints,'String');
np = str2num(npTxt);
persistent nf

if isempty(nf)
    nf = 1;
else
    nf=nf+1;
end
n = nf;


 primitiva = grafica_primitivas(curva,rell,np);
 handles.primitiva_n(n)=primitiva;
 handles.C = [handles.C;handles.primitiva_n(n).pixel(:,1)];
 handles.F = [handles.F;handles.primitiva_n(n).pixel(:,2)];
 
 guidata(hObject,handles);          
 
     
     plot(handles.C,handles.F,'.')
     hold on
    
     X=handles.primitiva_n(n).marcas(:,1);
     Y=handles.primitiva_n(n).marcas(:,2);
     hpoints=plot(X,Y,'r+','MarkerSize',12);    
    %delete(handles.hpoints)
    axis([-0.5 256.5 -0.5 256.5])
     set(gca,'Xtick',[],'Ytick',[]);
     hold off
     %save('primitiva_n','primitiva_n')


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Choose default command line output for matlabvn_mouse
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on key press with focus on triangulos and none of its controls.
function triangulos_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to triangulos (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in relleno.
function relleno_Callback(hObject, eventdata, handles)
% hObject    handle to relleno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of relleno


% --- Executes on button press in checkrell.
function checkrell_Callback(hObject, eventdata, handles)
% hObject    handle to checkrell (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkrell


% --- Executes when selected object is changed in seleprimi.
function seleprimi_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in seleprimi 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

primi = get(handles.seleprimi,'SelectedObject');
curva = get(primi,'Tag');

switch curva
    case 'lineas'
        set(handles.checkrell,'Value',0);
    case 'circulos'
        set(handles.controlPoints,'Enable','Off');
    case 'elipses'
        set(handles.controlPoints,'Enable','Off');
    case 'triangulos'
        set(handles.controlPoints,'Enable','Off');
    case 'bezier'
        set(handles.checkrell,'Value',0);
        set(handles.controlPoints,'Enable','On');
end
    
    



function controlPoints_Callback(hObject, eventdata, handles)
% hObject    handle to controlPoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of controlPoints as text
%        str2double(get(hObject,'String')) returns contents of controlPoints as a double


% --- Executes during object creation, after setting all properties.
function controlPoints_CreateFcn(hObject, eventdata, handles)
% hObject    handle to controlPoints (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushSelect.
function pushSelect_Callback(hObject, eventdata, handles)
% hObject    handle to pushSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 %exist('primitiva_n')
 %if exist('primitiva_n.mat')
 %     load primitiva_n
 % end
 primitiva_n=handles.primitiva_n;
 
  NumP = numel(primitiva_n); % Numero de primitivas graficas
 C=[]; F=[];

 for k=1:NumP
     C = [C; primitiva_n(k).pixel(:,1)];
     F = [F; primitiva_n(k).pixel(:,2)];
 end
 
    plot(C,F,'b.');
     axis([-0.5 256.5 -0.5 256.5])
     set(gca,'Xtick',[],'Ytick',[]);
     
    fighandle = get(handles.axes1,'parent');
    oldpointer = get(fighandle,'Pointer');
    hc=get(handles.axes1,'children');
    xdata = C;  % get(hc,'xdata');
    ydata = F;  % get(hc,'ydata');
      
      flaghandle = [];
      npoints = length(xdata);

      
      selectionflag = true;

 
while selectionflag
    nsel = 0;
   set(fighandle,'Pointer','cross');
   waitforbuttonpress;
   
  %set(fighandle,'WindowButtonUpFcn',@selectdone);
   cc=get(handles.axes1,'CurrentPoint');
   %dx = (axissize(2)-axissize(1))
   xy=cc(1,1:2);
   [distan,xselect,yselect] = closestpoint(xy,xdata,ydata,1,1);
   nsel=1;
   if distan <=5
       selectionflag = false;
   end
   
end

    prim = 1; j = 0;
 while prim == 1 & j <= NumP
     j = j + 1;
     P = primitiva_n(j).pixel;
      ex = find(P(:,1)==xselect);

    if ~isempty(ex)
        prim = isempty(find(P(ex,2)==yselect));
    end
     %prim = isempty(P(find(P(:,1)==xselect),2)==yselect);
      
 end
handles.np = j;
guidata(hObject,handles);

Xs=primitiva_n(j).marcas(:,1);
Ys=primitiva_n(j).marcas(:,2);
hold on
plot(Xs,Ys,'r+','MarkerSize', 12);
hold off



 
   set(fighandle,'Pointer',oldpointer)
   %set(fighandle,'WindowButtonUpFcn',[]);
  
% pointslist and xselect, yselect are already complete.
%     begin nested functions
% =====================================================

function selectdone(src,evnt) %#ok
%global flaghandle
  % nested function for mouse up
  % do we remove the selection tool?
  %if strcmpi(params.RemoveTool,'on')
    % delete the selection object from the plot
    %delete(selecthandle)
    %selecthandle = [];
  %end
  
  % do we remove the flagged points?
  %if strcmpi(params.RemoveFlagged,'on')
    % also remove the flagged/plotted points
    if ~isempty(flaghandle)
      delete(flaghandle)
      flaghandle = [];
    end
  %end
  
  % do we remove the flagged points?
  % cancel the WindowButtonFcn's that we had set
  set(fighandle,'WindowButtonUpFcn',[]);
  
  % restore the figure pointer to its original setting
  %if ~isempty(params.Pointer)
    set(fighandle,'Pointer',oldpointer)
  %end
  % and resume execution, back in the mainline
  uiresume


   
 % =====================================================
function flagpoints(flaghandle,xselect,yselect,nsel)
  % nested function for flagging the selected points
  %global flaghandle
  % Are these the first points flagged? If so,
  % we need to plot them and set the marker, etc.
  if isempty(flaghandle) && (nsel > 0)
    % hold the figure, so we can add the flagged points
    hold on
    
    if ~iscell(xselect)
      flaghandle = plot(xselect,yselect,'o');
      set(flaghandle,'Color','r','MarkerFaceColor','r')
    else
      flaghandle = plot(vertcat(xselect{:}),vertcat(yselect{:}),'o');
      set(flaghandle,'Color','r','MarkerFaceColor','o')
    end
    
    % now release the hold
    hold off
  elseif ~isempty(flaghandle)
    % otherwise, we just need to update xdata and ydata
    
    if nsel == 0
      set(flaghandle,'xdata',[],'ydata',[]);
      
    elseif ~iscell(xselect)
      set(flaghandle,'xdata',xselect,'ydata',yselect);
    else
      set(flaghandle,'xdata',vertcat(xselect{:}),'ydata',vertcat(yselect{:}));
    end
  end
  
% =====================================================
   
   
    


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in push_delete.
function push_delete_Callback(hObject, eventdata, handles)
% hObject    handle to push_delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%if exist('primitiva_n.mat')
%    delete primitiva_n.mat
%end
handles.C=[];
handles.F=[];
guidata(hObject,handles);  
clear all
cla


% --- Executes on button press in pushelimina.
function pushelimina_Callback(hObject, eventdata, handles)
% hObject    handle to pushelimina (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


choice = questdlg('Desea eliminar primtiva?', ...
	'Eliminar', ...
	'Si','No','No');
% Handle response
switch choice
    case 'Si'
        disp('Eliminando  ... ')
        
        handles.primitiva_n(handles.np) = [];
        guidata(hObject,handles);  
        
        C=[];F=[];
         for k=1:numel(handles.primitiva_n)
            C = [C; handles.primitiva_n(k).pixel(:,1)];
            F = [F; handles.primitiva_n(k).pixel(:,2)];
         end
 
        plot(C,F,'b.');
        axis([-0.5 256.5 -0.5 256.5])
        set(gca,'Xtick',[],'Ytick',[]);
        
        
    case 'No'
        disp([choice ' se elimina'])
        
    
end

   
   
    


% --- Executes on button press in checkMove.
function checkMove_Callback(hObject, eventdata, handles)
% hObject    handle to checkMove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkMove


% --- Executes on button press in pushMove.
function pushMove_Callback(hObject, eventdata, handles)
% hObject    handle to pushMove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n = handles.np

function my_MouseClickFcn(obj,event,hObject)
handles=guidata(hObject);
set(handles.figure1,'WindowButtonMotionFcn',{@my_MouseMoveFcn,hObject});
guidata(hObject,handles)
 
function my_MouseReleaseFcn(obj,event,hObject)
handles=guidata(hObject);
set(handles.figure1,'WindowButtonMotionFcn','');
disp('liberado')
guidata(hObject,handles);


 function my_MouseMoveFcn(obj,event,hObject)
 handles=guidata(hObject);
%move_p = get(handles.checkMove,'Value')
mousepos=get(handles.axes1,'CurrentPoint');
x = handles.primitiva_n(handles.np).pixel(:,1);
y = handles.primitiva_n(handles.np).pixel(:,2);

xm = handles.primitiva_n(handles.np).marcas(:,1);
ym = handles.primitiva_n(handles.np).marcas(:,2);
% x=get(handles.redbox,'xdata');
% y=get(handles.redbox,'ydata');
x_rel=x-x(1);
y_rel=y-y(1);
plot(x_rel+mousepos(1,1),y_rel+mousepos(1,2),'b.')
hold on
x_relm=xm-xm(1);
y_relm=ym-ym(1);
plot(x_relm+mousepos(1,1),y_relm+mousepos(1,2),'r+')
hold off


% x_relc=xm-x(1);
% y_relc=ym-y(1);

 axis([-0.5 256.5 -0.5 256.5])
 set(gca,'Xtick',[],'Ytick',[]);
%set(handles.redbox,'xdata',mousepos(1,1)+x_rel);
%set(handles.redbox,'ydata',mousepos(1,2)+y_rel);



% --- Executes on key press with focus on pushMove and none of its controls.
function pushMove_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushMove (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
