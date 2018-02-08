TextOut(0,LCD_LINE1,'test Encoders'); % Mostramos por pantalla el tipo de test
TextOut(0,LCD_LINE2,'Presione el boton central para');
TextOut(0,LCD_LINE3,'comenzar con el test');
while(~ButtonPressed(BTNCENTER))end % Esperamos a pulsar el boton central
ClearScreen();

velocidad = 30;

% TEST ENCODER A
TextOut(0, LCD_LINE1,'Encoder A');
ResetRotationCount(OUT_A); % Reseteamos el encoder
OnFwd(OUT_A,velocidad); % giramos el motor A
giro = MotorRotationCount(OUT_A); 
while(giro < 2000) % hasta que el giro no sea superior a 2000 grados mostramos los datos
    NumOut(0, LCD_LINE2,giro);
    giro = MotorRotationCount(OUT_A);
end
NumOut(0, LCD_LINE2,giro);
Off(OUT_A); % paramos el motor A
Wait(500);
ResetRotationCount(OUT_A); % Reseteamos el encoder y lo mostramos en pantalla
Wait(70);
giro = MotorRotationCount(OUT_A); 
TextOut(0, LCD_LINE2,'reseteado');
NumOut(0, LCD_LINE3,giro);
Wait(500);
ClearScreen();

% TEST ENCODER C
TextOut(0, LCD_LINE1,'Encoder C');
ResetRotationCount(OUT_C); % Reseteamos el encoder C
OnFwd(OUT_C,velocidad); % giramos el motor C
giro = MotorRotationCount(OUT_C);
while(giro < 2000) % hasta que el giro no sea superior a 2000 grados mostramos los datos
    NumOut(0, LCD_LINE2, giro);
    giro = MotorRotationCount(OUT_C);
end
NumOut(0, LCD_LINE2, giro);
Off(OUT_C); % paramos el motor C
Wait(500);
ResetRotationCount(OUT_C); % Reseteamos el encoder C y lo mostramos en pantalla
Wait(70);
giro = MotorRotationCount(OUT_C); 
TextOut(0, LCD_LINE2, 'reseteado');
NumOut(0, LCD_LINE3, giro);
Wait(500);
ClearScreen();

TextOut(0,LCD_LINE1,'Presione el boton central para'); % pulsamos enter para finalizar el programa
TextOut(0,LCD_LINE2,'finalizar el test');
while(~ButtonPressed(BTNCENTER))end
ClearScreen();
Stop(1);