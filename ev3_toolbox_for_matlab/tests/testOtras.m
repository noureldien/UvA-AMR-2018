TextOut(0,LCD_LINE1,'test Otros'); % Mostramos por pantalla el tipo de test
TextOut(0,LCD_LINE2,'Presione el boton central para');
TextOut(0,LCD_LINE3,'comenzar con el test');
while(~ButtonPressed(BTNCENTER))end % Esperamos a pulsar el botón central
ClearScreen(); 

time = CurrentTick();   % mostramos el tiempo de ejecución
TextOut(0,LCD_LINE1,'Tiempo de ejecucion:');
NumOut(0,LCD_LINE2,time);
Wait(2000);

ClearScreen();
time = FreeMemory();    % liberamos de la memoria la variable time
TextOut(0,LCD_LINE1,'Memoria liberada');
Wait(2000);

TextOut(0,LCD_LINE1,'Presione el boton central para'); % pulsamos el botón central para finalizar el programa
TextOut(0,LCD_LINE2,'finalizar el test');
while(~ButtonPressed(BTNCENTER))end
ClearScreen();

Stop(0);