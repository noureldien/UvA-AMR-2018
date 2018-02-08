disp('Test del modelo de ev3 en vrep. Cambie a la ventana del simulador');
pause(2);

disp('--------TEST INTERFAZ--------');
ejecutarCodigoNXC testInterfaz

disp('--------TEST BUMPER--------');
ejecutarCodigoNXC testBumper

disp('--------TEST GIROSCOPIO--------');
ejecutarCodigoNXC testGyroSensor

disp('--------TEST SENSOR DE COLOR--------');
ejecutarCodigoNXC testColorSensor

disp('--------TEST SONAR--------');
ejecutarCodigoNXC testSonar

disp('--------TEST ENCODERS--------');
ejecutarCodigoNXC testEncoders

disp('--------TEST FICHEROS--------');
ejecutarCodigoNXC testFicheros

disp('--------TEST DE OTRAS FUNCIONES--------');
ejecutarCodigoNXC testOtras

disp('TESTS FINALIZADOS!!');