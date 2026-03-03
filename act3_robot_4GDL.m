% Limpieza de pantalla
clear all
close all
clc

% Declaración de variables simbólicas
syms L1(t) L2(t) L3(t) L4(t) t

% Configuración del robot (todas prismáticas)
RP = [1 1 1 1];

% Coordenadas articulares
Q = [L1 L2 L3 L4];

% Velocidades generalizadas
Qp = diff(Q,t);

% Número de GDL
GDL = size(RP,2);

%% ===============================
% L1 → L2
% Rotación -90° en X1
% Traslación +Z1
% ===============================

R(:,:,1) = [1 0 0;
            0 0 1;
            0 -1 0];

P(:,:,1) = [0;
            0;
            L1];

%% ===============================
% L2 → L3
% Rotación -90° en Y2
% Traslación +X2
% ===============================

R(:,:,2) = [0 0 -1;
            0 1  0;
            1 0  0];

P(:,:,2) = [L2;
            0;
            0];

%% ===============================
% L3 → L4
% Sin rotación
% Traslación -Z3
% ===============================

R(:,:,3) = eye(3);

P(:,:,3) = [0;
            0;
           -L3];

%% ===============================
% L4 → EF
% Sin rotación
% Traslación +Z4 (nuevo GDL)
% ===============================

R(:,:,4) = eye(3);

P(:,:,4) = [0;
            0;
            L4];

%% ===============================
% MATRICES HOMOGÉNEAS
% ===============================

Vector_Zeros = zeros(1,3);

for i = 1:GDL
    
    A(:,:,i) = simplify([R(:,:,i) P(:,:,i);
                         Vector_Zeros 1]);

    if i == 1
        T(:,:,i) = A(:,:,i);
    else
        T(:,:,i) = simplify(T(:,:,i-1)*A(:,:,i));
    end

    disp(['Matriz de Transformación global T',num2str(i)]);
    pretty(T(:,:,i))

    RO(:,:,i) = T(1:3,1:3,i);
    PO(:,:,i) = T(1:3,4,i);
end

%% ===============================
% JACOBIANO DIFERENCIAL
% ===============================

for i = 1:GDL
    for j = 1:GDL
        Jv_d(i,j) = functionalDerivative(PO(i,1,GDL), Q(j));
    end
end

Jv_d = simplify(Jv_d);

%% ===============================
% JACOBIANO ANALÍTICO
% ===============================

Jv_a = sym(zeros(3,GDL));
Jw_a = sym(zeros(3,GDL));

for k = 1:GDL
    
    if RP(k) == 0
        try
            Jv_a(:,k) = cross(RO(:,3,k-1), PO(:,:,GDL)-PO(:,:,k-1));
            Jw_a(:,k) = RO(:,3,k-1);
        catch
            Jv_a(:,k) = cross([0;0;1], PO(:,:,GDL));
            Jw_a(:,k) = [0;0;1];
        end
        
    else
        try
            Jv_a(:,k) = RO(:,3,k-1);
        catch
            Jv_a(:,k) = [0;0;1];
        end
        Jw_a(:,k) = [0;0;0];
    end
end

Jv_a = simplify(Jv_a);
Jw_a = simplify(Jw_a);

disp('Velocidad lineal');
V = simplify(Jv_a*Qp.');
pretty(V);

disp('Velocidad angular');
W = simplify(Jw_a*Qp.');
pretty(W);
