clc; clear; close all;

x1=[-5 -5 5 5];
x2=[-5 5 -5 5];
t=[-5 -5 -5 5];

% Condiciones iniciales
Rf=1000;

wb=-50*rand;
w1=-50*rand;
w2=-50*rand;

w=[wb w1 w2];
bias=-5;

% Resistencias
R=[-Rf/wb -Rf/w1 -Rf/w2]

%% Iniciar el proceso de entrenamiento
% Por regla de Hebb
eps=0.1;% Coeficiente de la velocidad de entrenamiento

lim_epoch=200;
Epoch=0;

%iteraciones de Hebb
for i=1: lim_epoch
    vector_error=[];
    for j=1: length(t)
        x=[bias x1(j) x2(j)];
        % Cálculo de la salida
        v=w*x';
        % Función signum
        if v>=0 
            y=5;
        else
            y=-5;
        end
        % Calcular el error
        e=t(j)-y
        % Actualización de pesos
        w=w+eps*e*x;
        % Vector del error
        vector_error=[vector_error e];
    end
    Epoch=Epoch+1;
    % Condición de terminación
    if norm(vector_error)==0
        disp('Pesos Finales: ')
        w
        disp('Épocas: ')
        Epoch
        disp('Valores de resistencias: ')
        R=[-Rf/wb -Rf/w1 -Rf/w2]
        break
    end
end

% Prueba
for i=1: length(t)
    y(i)=-Rf*(bias/R(1)+x1(i)/R(2)+x2(i)/R(3));
% Función signum
        if y(i)>=0 
            y(i)=-5;
        else
            y(i)=5;
        end
end

disp('Salidas: ')
y
