%% Limpieza
clear
close all
clc

%% Variables simbólicas (PRISMÁTICAS)
syms d1(t) d2(t) d3(t) d4(t) t

RP = [1 1 1 1];   % Todas prismáticas
Q  = [d1 d2 d3 d4];
Qp = diff(Q,t);

GDL = length(RP);

%% --- Articulación 1 ---
% Traslación en Z
P(:,:,1) = [0;0;d1];

% Rotación fija (-90° en X si necesitas alinear marcos)
R(:,:,1) = [1 0 0;
            0 0 1;
            0 -1 0];

%% --- Articulación 2 ---
% Traslación en X
P(:,:,2) = [d2;0;0];

% Sin rotación variable
R(:,:,2) = eye(3);

%% --- Articulación 3 ---
% Traslación en Y
P(:,:,3) = [0;d3;0];

R(:,:,3) = eye(3);

%% --- Articulación 4 ---
% Traslación en Z
P(:,:,4) = [0;0;d4];

R(:,:,4) = eye(3);

%% Construcción de matrices homogéneas
Vector_Zeros = zeros(1,3);

for i = 1:GDL
    
    A(:,:,i) = [R(:,:,i) P(:,:,i);
                Vector_Zeros 1];
    
    if i == 1
        T(:,:,i) = A(:,:,i);
    else
        T(:,:,i) = simplify(T(:,:,i-1)*A(:,:,i));
    end
    
    PO(:,:,i) = T(1:3,4,i);
    RO(:,:,i) = T(1:3,1:3,i);
    
    disp(['T',num2str(i),' ='])
    pretty(T(:,:,i))
end

%% JACOBIANO ANALÍTICO (PRISMÁTICO)

for k = 1:GDL
    
    try
        Jv(:,k) = RO(:,3,k-1);
    catch
        Jv(:,k) = [0;0;1];
    end
    
    Jw(:,k) = [0;0;0];   % Prismáticas no generan velocidad angular
end

Jv = simplify(Jv);
Jw = simplify(Jw);

disp('Velocidad lineal:')
V = simplify(Jv*Qp.')
pretty(V)

disp('Velocidad angular:')
W = simplify(Jw*Qp.')
pretty(W)
