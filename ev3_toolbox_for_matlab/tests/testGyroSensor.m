SetSensorHtGyro(IN_3); % informamos que el sensor giroscópico esta en el puerto 1

TextOut(0,LCD_LINE1,'test Giroscopio'); % Mostramos por pantalla el tipo de test
TextOut(0,LCD_LINE2,'Presione el boton central para');
TextOut(0,LCD_LINE3,'comenzar con el test');
while(~ButtonPressed(BTNCENTER))end % Esperamos a pulsar el botón central
ClearScreen();

%TEST VELOCIDAD ANGULAR
velocity = 0;
rate = SensorHtGyro(IN_3, 0);
while (velocity<=100) % Hasta que la velocidad sea 100 o mas
    OnFwd(OUT_A, velocity);
    TextOut(0,LCD_LINE1,['rate = ' num2str(rate)]); % mostramos la velocidad angular en la pantalla del robot
    velocity = velocity+2;
    rate = SensorHtGyro(IN_3, 0);
    Wait(500);
end
ClearScreen();

Off(OUT_AC);

%TEST ANGULO GIRADO
ResetAngle();
Wait(70);

OnFwd(OUT_A, 50);

for i = 1:5000 % Iteramos 5000 veces
    TextOut(0,LCD_LINE1,['angle = ' num2str(SensorAngle())]); % motramos el angulo girado
end

Off(OUT_A);
TextOut(0,LCD_LINE1,['angle = ' num2str(SensorAngle())]);
Wait(1000);
ResetAngle();
Wait(70);
TextOut(0,LCD_LINE1,['angle = ' num2str(SensorAngle())]); % Mostramos que se ha reniciado el contador de angulos
TextOut(0,LCD_LINE2,'Reseteado');
Wait(2000);

TextOut(0,LCD_LINE1,'Presione el boton central para'); % pulsamos el botón central para finalizar el programa
TextOut(0,LCD_LINE2,'finalizar el test');
while(~ButtonPressed(BTNCENTER))end
ClearScreen();
Stop(1);