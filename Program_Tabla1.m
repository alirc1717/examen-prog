clc
clear all
%Según el Catálogo de Entidades del 
%Instituto Nacional Electoral
%EL ID que le corresponde al estado de Sonora es 26

%Se lee el archivo .cvs
%y se almacena en dataTable
dataTable = readtable('200511COVID19MEXICO.csv');

%Seobtiene el tamaño de la tabla
tam= size(dataTable);
%Y solo me quedo con el valor de las filas
filas= tam(1,1);


j=1;
%Recorro la tabla "dataTable"
for i=1:1:filas
    %Y Se verifica primero que corresponda al estado de Sonora la
    %informaicón
    if dataTable.ENTIDAD_RES(i)==26 %ID del Estado de Sonora
        %Si es así, se verifica si la persona se cuenta fallecida, si se
        %cumple la condición se almcaena la información requerida
        if ~strcmpi('9999-99-99',dataTable.FECHA_DEF(i))  
            Entidad(j,1)=dataTable.ENTIDAD_RES(i);
            Fecha_actual(j,1)=dataTable.FECHA_ACTUALIZACION(i);
            Fecha_defuncion(j,1)=dataTable.FECHA_DEF(i);
            Fecha_sintomas(j,1)=dataTable.FECHA_SINTOMAS(i);
            ID_(j,1)=dataTable.ID_REGISTRO(i);
            j=j+1;
        end
    end
end

%Se genera la tabla con las respectiva información
tabla_f=table(Fecha_actual, ID_, Entidad, Fecha_sintomas, Fecha_defuncion);
%Se crea el archivo "tabla1.csv"
writetable(tabla_f,'tabla1.csv')
