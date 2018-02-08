
SetSensorTouch(IN_1); % informamos que el sensor tactil esta en el puerto 1
velocidad = 20;

TextOut(0,LCD_LINE1,'Test Bumper'); % Mostramos por pantalla el tipo de test
TextOut(0,LCD_LINE2,'Presione el boton central para');
TextOut(0,LCD_LINE3,'comenzar el test');
while(~ButtonPressed(BTNCENTER))end % Esperamos a pulsar el boton central
ClearScreen();

OnFwd(OUT_A,velocidad); % giramos el robot 180 grados.
Wait(3400);

OnRev(OUT_AC, velocidad); % activamos los dos motores hacia atras
while(SENSOR_1 == 0)end; % esperamos a que el sensor haya sido pulsado en el puerto 1
OnFwd(OUT_AC, velocidad); % cuando haya sido pulsado vamos hacia adelante
SetSensorTouch(IN_2); % cambiamos de puerto y esperamos 1 segundo
Wait(1000);

% haremos lo mismo para el resto de puertos, esto servirá para probar todos
% los puertos para la funcion SENSOR_N
OnRev(OUT_AC, velocidad);
while(SENSOR_2 == 0)end;
OnFwd(OUT_AC, velocidad);
SetSensorTouch(IN_3);
Wait(1000);
OnRev(OUT_AC, 30);
while(SENSOR_3 == 0)end;
OnFwd(OUT_AC, velocidad);
SetSensorTouch(IN_4);
Wait(1000);
OnRev(OUT_AC, velocidad);
while(SENSOR_4 == 0)end;
OnFwd(OUT_AC, velocidad);
Wait(1000);
Off(OUT_AC); % cuando hayamos acabado paramos el motor

TextOut(0,LCD_LINE1,'Presione el boton central para'); % pulsamos el boton central para finalizar el programa
TextOut(0,LCD_LINE2,'finalizar el test');
while(~ButtonPressed(BTNCENTER))end
ClearScreen();
Stop(1);