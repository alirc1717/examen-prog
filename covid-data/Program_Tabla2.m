clc
clear all
%Según el Catálogo de Entidades del 
%Instituto Nacional Electoral
%EL ID correspondiente a los estados es:
% Sonora        26
% Chihuahua     5
% Nuevo León    19
% Puebla        21

%Se lee el archivo .cvs
%y se almacena en dataTable
dataTable = readtable('200511COVID19MEXICO.csv');

%Seobtiene el tamaño de la tabla
tam= size(dataTable);
%Y solo me quedo con el valor de las filas
filas= tam(1,1);


j=1;
n=1;
estado_=0;
%Recorro la tabla "dataTable"
while(n<=4)
    if n==1
        estado_=26;
    end
    if n==2
        estado_=5;
    end
    if n==3
        estado_=19;
    end
    if n==4
        estado_=21;
    end
for i=1:1:filas
    %Y Se verifica primero que corresponda al estado establecido
    %previamente
    if dataTable.ENTIDAD_RES(i)==estado_ %ID del Estado correspondiente
        %Si es así, se verifica si la persona se cuenta fallecida, si se
        %cumple la condición se almcaena la información requerida  
            Entidad(j,1)=dataTable.ENTIDAD_RES(i);
            Fecha_ingre(j,1)=dataTable.FECHA_INGRESO(i);
            Fecha_sintomas(j,1)=dataTable.FECHA_SINTOMAS(i);
            ID_(j,1)=dataTable.ID_REGISTRO(i);
            j=j+1;
    end
end
    n=n+1;
end

%Se genera la tabla con las respectiva información
tabla_f=table(ID_, Entidad, Fecha_sintomas, Fecha_ingre);
%Se crea el archivo "tabla1.csv"
writetable(tabla_f,'tabla2.csv')
