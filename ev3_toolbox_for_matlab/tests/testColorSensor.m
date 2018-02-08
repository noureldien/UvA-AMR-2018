SetSensorLight(IN_1); % informamos que el sensor de color esta en el puerto 1
velocidad = 20;

TextOut(0,LCD_LINE1,'test sensor de color'); % Mostramos por pantalla el tipo de test
TextOut(0,LCD_LINE2,'Presione el boton central para');
TextOut(0,LCD_LINE3,'comenzar con el test');
while(~ButtonPressed(BTNCENTER))end % Esperamos a pulsar el boton central
ClearScreen();

OnFwd(OUT_AC, velocidad); % empezamos la marcha hacia adelante

%TEST DEL SENSOR DE LUZ
intensity = Sensor(IN_1); % tomamos el primer dato
cadena = ['intensity = ' num2str(intensity)]; % y lo mostramos por la pantalla del robot
TextOut(0,LCD_LINE1,cadena);
while intensity > 10 % hasta que no hayamos detectado una intensidad menor que 10
    intensity = Sensor(IN_1); % mostramos los datos en la pantalla del robot
    cadena = ['intensity = ' num2str(intensity)];
    TextOut(0,LCD_LINE1,cadena);
end

% PREPARACIÓN PARA LA LECTURA DE COLORES
ClearScreen();
Off(OUT_A); %giramos el robot aprox 180 grado en sentido antihorario
ResetAngle();
angle = SensorAngle();
while(angle > -170) % hasta que el angulo del sensor giroscopico sea menor -170
    color = SensorColor(); % mostramos por pantalla el valor del color
    cadena = ['color = ' num2str(color)];
    TextOut(0,LCD_LINE1,cadena);
    angle = SensorAngle();
end
OnFwd(OUT_A, velocidad); % seguimos hacia adelante

%TEST SENSOR DE COLOR
color = SensorColor();
blanco = 0;
contador = 2;
while(contador ~= 0) % mientras no se haya detectado blanco 2 veces
    cadena = ['color = ' num2str(color)]; % se muestra el color
    TextOut(0,LCD_LINE1,cadena);
    if(color == 6 && blanco == 0) % si se ha detectado blanco por primera vez
        contador = contador -1; % restamos el blanco
        blanco = 1; % y indicamos que ya hemos detectado el primer blanco
    end
    if(color ~= 6) % cuando el color cambie, esperamos que se detecte el siguiente blanco
        blanco = 0;
    end
    color = SensorColor();
end
Wait(500); % esperamos 0.5 segundos
Off(OUT_AC); % paramos los motores

TextOut(0,LCD_LINE1,'Presione el boton central para'); % pulsamos el botón central para finalizar el programa
TextOut(0,LCD_LINE2,'finalizar el test');
while(~ButtonPressed(BTNCENTER))end
Stop(1);