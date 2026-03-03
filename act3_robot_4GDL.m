%Limpieza de pantalla
clear all
close all
clc

%Declaración de variables simbólicas
syms l1(t) l2(t) l3(t) l4(t) t 

%Configuración del robot, 0 para junta rotacional, 1 para junta prismática
RP=[1 1 1 1];

%Creamos el vector de coordenadas articulares
Q= [l1, l2, l3, l4];
%disp('Coordenadas generalizadas');
%pretty (Q);

%Creamos el vector de velocidades generalizadas
Qp= diff(Q, t);
%disp('Velocidades generalizadas');
%pretty (Qp);

%Número de grado de libertad del robot
GDL= size(RP,2);
GDL_str= num2str(GDL);


%Articulación 1 
%Posición de la articulación 1 respecto a 0
P(:,:,1)= [0; 0; l1];

%Matriz de rotación de la junta 1 respecto a 0.... -90º en x (alineación fija)
R(:,:,1)=        [0 0 1;
                  0 1 0;
                 -1 0 0];


%Articulación 2 
%Posición de la articulación 2 respecto a 1
P(:,:,2)= [l2;0;0];

%Matriz de rotación de la junta 2 respecto a 1 (sin rotación variable)
R(:,:,2)=   [1  0  0;
             0  1  0;
             0  0  1];
    

%Articulación 3 
%Posición de la articulación 3 respecto a 2
P(:,:,3)= [0; l3; 0];

%Matriz de rotación de la junta 3 respecto a 2
R(:,:,3)=   [1 0 0;
             0 1 0;     
             0 0 1];


%Articulación 4
%Posición de la articulación 4 respecto a 3
P(:,:,4)= [0; 0; l4];

%Matriz de rotación de la junta 4 respecto a 3
R(:,:,4)=   [1 0 0;
             0 1 0;
             0 0 1];


%Creamos un vector de ceros
Vector_Zeros= zeros(1, 3);

%Inicializamos las matrices de transformación Homogénea locales
A(:,:,GDL)=simplify([R(:,:,GDL) P(:,:,GDL); Vector_Zeros 1]);

%Inicializamos las matrices de transformación Homogénea globales
T(:,:,GDL)=simplify([R(:,:,GDL) P(:,:,GDL); Vector_Zeros 1]);

%Inicializamos las posiciones vistas desde el marco de referencia inercial
PO(:,:,GDL)= P(:,:,GDL); 

%Inicializamos las matrices de rotación vistas desde el marco de referencia inercial
RO(:,:,GDL)= R(:,:,GDL); 


for i = 1:GDL
    i_str= num2str(i);

    %Matrices locales
    A(:,:,i)=simplify([R(:,:,i) P(:,:,i); Vector_Zeros 1]);

    %Matrices globales
    try
       T(:,:,i)= T(:,:,i-1)*A(:,:,i);
    catch
       T(:,:,i)= A(:,:,i);
    end

    disp(strcat('Matriz de Transformación global T', i_str));
    T(:,:,i)= simplify(T(:,:,i));
    pretty(T(:,:,i))

    RO(:,:,i)= T(1:3,1:3,i);
    PO(:,:,i)= T(1:3,4,i);
end


%Calculamos el jacobiano lineal de forma diferencial

Jv11= functionalDerivative(PO(1,1,GDL), l1);
Jv12= functionalDerivative(PO(1,1,GDL), l2);
Jv13= functionalDerivative(PO(1,1,GDL), l3);
Jv14= functionalDerivative(PO(1,1,GDL), l4);

Jv21= functionalDerivative(PO(2,1,GDL), l1);
Jv22= functionalDerivative(PO(2,1,GDL), l2);
Jv23= functionalDerivative(PO(2,1,GDL), l3);
Jv24= functionalDerivative(PO(2,1,GDL), l4);

Jv31= functionalDerivative(PO(3,1,GDL), l1);
Jv32= functionalDerivative(PO(3,1,GDL), l2);
Jv33= functionalDerivative(PO(3,1,GDL), l3);
Jv34= functionalDerivative(PO(3,1,GDL), l4);

%Creamos la matriz del Jacobiano lineal
jv_d=simplify([Jv11 Jv12 Jv13 Jv14;
               Jv21 Jv22 Jv23 Jv24;
               Jv31 Jv32 Jv33 Jv34]);


%Calculamos el jacobiano lineal de forma analítica

Jv_a = sym(zeros(3,GDL));
Jw_a = sym(zeros(3,GDL));

for k= 1:GDL
    if RP(k)==0 
       %Para las juntas de revolución
        try
            Jv_a(:,k)= cross(RO(:,3,k-1), PO(:,:,GDL)-PO(:,:,k-1));
            Jw_a(:,k)= RO(:,3,k-1);
        catch
            Jv_a(:,k)= cross([0;0;1], PO(:,:,GDL));
            Jw_a(:,k)=[0;0;1];
         end
     else
        %Para las juntas prismáticas
        try
            Jv_a(:,k)= RO(:,3,k-1);
        catch
            Jv_a(:,k)=[0;0;1];
        end
        Jw_a(:,k)=[0;0;0];
     end
end    

Jv_a= simplify (Jv_a);
Jw_a= simplify (Jw_a);


disp('Velocidad lineal obtenida mediante el Jacobiano lineal');
V=simplify (Jv_a*Qp');
pretty(V);

disp('Velocidad angular obtenida mediante el Jacobiano angular');
W=simplify (Jw_a*Qp');
pretty(W);
