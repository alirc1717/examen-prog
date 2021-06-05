dataTable = readtable('tabla2.csv');
%Se obtiene los datos almacenados en 'tabla2.csv'
tam= size(dataTable);
%Se obtiene el tamaño del mismo
filas= tam(1,1);

%Se definen las variables que almacenarán la cantidad de hospitalizaos para
%cada estado
sonora=0;
chihuahua=0;
nuevoleon=0,
puebla=0;

%Se recorre los dabos contando el umero de hospitalizados para cada estado
for i=1:1:filas

    if dataTable.Entidad(i) ==26
        sonora=sonora+1;
    end
    if dataTable.Entidad(i) ==5
        chihuahua=chihuahua+1;
    end
    if dataTable.Entidad(i) ==19
        nuevoleon=nuevoleon+1;
    end
    if dataTable.Entidad(i) ==21
        puebla=puebla+1;
    end
end

%Se grafica el número de hospitalizados
c = categorical({'Sonora','Chihuahua','Nuevo León', 'Puebla'});
prices = [sonora chihuahua nuevoleon puebla];

bar(c,prices)
title('Casos hospitalizados por COVID 19')
xlabel('Estados') 
ylabel('Número de casos hospitalizados') 