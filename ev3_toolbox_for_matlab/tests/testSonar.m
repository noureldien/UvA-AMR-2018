SetSensorUltrasonic(IN_1); % informamos que el sensor ultrasonico esta en el puerto 1

TextOut(0,LCD_LINE1,'test Sonar'); % Mostramos por pantalla el tipo de test
TextOut(0,LCD_LINE2,'Presione el boton central para');
TextOut(0,LCD_LINE3,'comenzar con el test');
while(~ButtonPressed(BTNCENTER))end % Esperamos a pulsar el boton intro
ClearScreen(); 

OnFwd(OUT_AC,40);

%TEST SENSOR ULTRASONICO (MEDIDAS)
distancia = SensorUS(IN_1);
mensaje = ['distancia = ' num2str(distancia)];
TextOut(0,LCD_LINE1,mensaje);
while distancia > 20 % hasta que la distancia sea menor que 20 cm
    distancia = SensorUS(IN_1);
    mensaje = ['distancia = ' num2str(distancia)]; % mostramos la distancia por pantalla
    TextOut(0,LCD_LINE1,mensaje);
end
Off(OUT_AC); % paramos los motores
Wait(2000);

TextOut(0,LCD_LINE1,'Presione el boton central para'); % pulsamos el botón central para finalizar el programa
TextOut(0,LCD_LINE2,'finalizar el test');
while(~ButtonPressed(BTNCENTER))end
Stop(0);