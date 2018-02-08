
TextOut(0,LCD_LINE1,'Test interfaz'); % Mostramos por pantalla el tipo de test
TextOut(0,LCD_LINE2,'Presione el boton central para');
TextOut(0,LCD_LINE3,'comenzar el test');
while(~ButtonPressed(BTNCENTER))end % Esperamos a pulsar el botón central
ClearScreen();
Wait(500);

% Pulsamos los botones que nos aparecerán en la pantalla
TextOut(0,LCD_LINE8,'Pulsa el boton indicado');

TextOut(0,LCD_LINE1,'CENTRO');
while(~ButtonPressed(BTNCENTER))end
TextOut(0,LCD_LINE1,'ABAJO');
while(~ButtonPressed(BTNEXIT))end
TextOut(0,LCD_LINE1,'IZQUIERDA');
while(~ButtonPressed(BTNLEFT))end
TextOut(0,LCD_LINE1,'DERECHA');
while(~ButtonPressed(BTNRIGHT))end
ClearScreen();

% Pulsamos centro para ir cambiando los colores de las luces de estado
TextOut(0,LCD_LINE6,'Pulsa el boton central para');
TextOut(0,LCD_LINE7,'cambiar el color de la luz');
TextOut(0,LCD_LINE8,'de estado y su parpadeo');

TextOut(0,LCD_LINE1,'luz verde fija');
StatusLight(0,0);
while(~ButtonPressed(BTNCENTER))end
TextOut(0,LCD_LINE2,'cambiando');
Wait(500);
TextOut(0,LCD_LINE2,' ');
TextOut(0,LCD_LINE1,'luz verde con parpadeo');
StatusLight(0,1);
while(~ButtonPressed(BTNCENTER))end
TextOut(0,LCD_LINE2,'cambiando');
Wait(500);
TextOut(0,LCD_LINE2,' ');
TextOut(0,LCD_LINE1,'luz ambar fija');
StatusLight(1,0);
while(~ButtonPressed(BTNCENTER))end
TextOut(0,LCD_LINE2,'cambiando');
Wait(500);
TextOut(0,LCD_LINE2,' ');
TextOut(0,LCD_LINE1,'luz ambar con parpadeo');
StatusLight(1,1);
while(~ButtonPressed(BTNCENTER))end
TextOut(0,LCD_LINE2,'cambiando');
Wait(500);
TextOut(0,LCD_LINE2,' ');
TextOut(0,LCD_LINE1,'luz roja fija');
StatusLight(2,0);
while(~ButtonPressed(BTNCENTER))end
TextOut(0,LCD_LINE2,'cambiando');
Wait(500);
TextOut(0,LCD_LINE2,' ');
TextOut(0,LCD_LINE1,'luz roja con parpadeo');
StatusLight(2,1);
while(~ButtonPressed(BTNCENTER))end
TextOut(0,LCD_LINE2,'cambiando');
Wait(500);
TextOut(0,LCD_LINE2,' ');
TextOut(0,LCD_LINE1,'luz apagada');
StatusLight(3,0);
while(~ButtonPressed(BTNCENTER))end
Wait(500);

TextOut(0,LCD_LINE1,'Presione el boton central para'); % pulsamos el botón central para finalizar el programa
TextOut(0,LCD_LINE2,'finalizar el test');
while(~ButtonPressed(BTNCENTER))end
Stop(1);