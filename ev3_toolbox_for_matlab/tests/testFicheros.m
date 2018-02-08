TextOut(0,LCD_LINE1,'test Ficheros'); % Mostramos por pantalla el tipo de test
TextOut(0,LCD_LINE2,'Presione el boton central para');
TextOut(0,LCD_LINE3,'comenzar con el test');
while(~ButtonPressed(BTNCENTER))end % Esperamos a pulsar el boton central
ClearScreen(); 

file = [];
CreateFile('hola', 1000, file); % creamos el fichero
bytes = 0;
TextOut(0,LCD_LINE1,'ESCRIBIENDO FICHERO...');
Wait(1000);
for i = 1:10 % escribimos 10 lineas con numeros aleatorios
    WriteLnString(file, num2str(rand), bytes);
end
tamtotal = 0;
CloseFile(file); % cerramos el archivo
file = [];
OpenFileRead('hola', tamtotal, file); % abrimos el fichero para leerlo
string = '';
TextOut(0,LCD_LINE1,'MOSTRANDO FICHERO...');
Wait(1000);
while ReadLnString(file, string) % mostramos las 10 lineas del fichero
    TextOut(0,LCD_LINE2,string);
    Wait(500);
end
CloseFile(file); % cerramos el archivo
DeleteFile('hola'); % eliminamos el archivo

TextOut(0,LCD_LINE1,'Presione el boton central para'); % pulsamos el botón central para finalizar el programa
TextOut(0,LCD_LINE2,'finalizar el test');
while(~ButtonPressed(BTNCENTER))end
Stop(0);