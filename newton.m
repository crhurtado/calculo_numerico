disp('Polinomio de Interpolación de Newton'); 
% El comando disp se utiliza para mostrar texto o variables por pantalla
% En este caso el titulo del Programa
clear all;
% El comando clear all se utiliza para limpiar o borrar tanto la pantalla
% de comandos como la memoria que contiene los valores de las variables,
% esto con el fin de evitar errores asi como tambien confusiones a la hora
% de revisar los resultados almacenados en las variables
disp(' ');
% El comando disp de esta manera puede ser utilizado para crear
% interlineados que mejores el entendimiento de lo que muestra la pantalla
N=input('Ingrese el Numero de Datos: ');
% El comando input lee el valor de una variable declarada, y a la vez
% muestra un texto que sirve de guia para dar indicaciones al usuario, la
% sintanxis es la siguiente: variable=input('texto por pantalla');
% En este input se lee el numero de datos que maneja el usuario
disp(' ');

for I=1:N
    % Este ciclo repetitivo utiliza a I como contador y va desde 1 hasta N,
    % y se utiliza para leer los valores de X y Fx
    disp(sprintf('Punto %d',I-1));
    % el comando disp convinado con sprintf permite combinar texto y
    % variables en una misma linea, este disp muestra el punto del cual se
    % estan leyendo los valores
    X(I)=input(sprintf('X(%d): ',I-1));
    % El input combinado con el sprintf permite motrar texto y variables y
    % leer el valor de una variable en la misma linea, en este caso leemos
    % el valor del vector X en la posición I, en matlab no es necesario
    % declarar las variables y en el caso de los vectores estos se
    % autoexpanden a medida que se llenan los datos
    FX(I,1)=input(sprintf('f(x%d): ',I-1));
    % Este input lee los valores de Fx, y los almacena todos en la columna
    % uno, Fx, es un arreglo o matriz, en este caso debemos indicar filar y
    % columnas en la variable de la siguiente manera V(f,c)
    disp('--------------');
end

for J=1:N-1
    % En este for J, que es el contador, va a indicar las diferencias
    % divididas que se van a calcular, en especial el orden, es decir, la
    % cantidad de columnas de diferencias divididas a calcular.
    K=J+1;
    % K indica la columna en la cual se va a escribir los resultados de los
    % calculos de las diferencias, el +1 es para comenzar siempre desde la
    % segunda columna, ya que la primera se llena con los datos
    % introducidos por el usuario
    for I=1:N-J
        % Este for realizara el calculo, fila a fila de las diferencias
        % divididas, N-J nos servirá de referencia para determinar el
        % numero de filas a calcular por cada columna
        FX(I,K)=(FX(I+1,J)-FX(I,J))/(X(I+J)-X(I));
        % Esta es la formula para el calculo de las diferencias
    end
end
disp(' ')
disp('...')
STOP=input('Presione Enter para continuar');
% Se utiliza una variable extra con un input para pausar la ejecución del
% programa
home
% Similar al clear all el home limpia el contenido de la pantalla, sin
% embargo, no borra los datos almacenados en las variables

disp(sprintf('Diferencias Divididas')),
disp(' ')
disp(FX)
% Se muestra la matriz Fx con un disp y esta aparecera en forma de tabla,
% aunque sin ningun tipo de delimitación o lineas


disp(' ')
disp('...')
STOP=input('Presione Enter para continuar');
% Se pausa la pantalla para observar mejor la tabla de las diferencias
home

disp('                    Coeficientes del Polinomio'),
disp(' ')
for J=1:N
    % Este for muestra por pantalla los coeficientes del polinomio de
    % interpolación
    disp(sprintf('b%d: %0.3f', J-1, FX(1,J))),
    % El disp muestra los valores de los coeficientes, que se encuentran
    % ubicados en la primera fila de la matriz FX, por ello el (1,J)
end

disp(' ')
XI=input('     Ingrese el valor de x que desea interpolar: ');
% Este input solicita un valor intermedio para interpolar, y o guarda en la
% variable XI
FA=1;
% Se inicializa la variable FA, la cual por ser un acumulador de
% multiplicación se inicializa en 1
Y=0;
% Se inicializa la variable Y, la cual por ser un acumulador de
% suma se inicializa en 0

resp=input('Desea visualizar el Error Aproximado? (use 1 para Si y 0 para No): ');
% Leemos con la variable resp la opción del usuario de visualizar o no el
% error aproximado asi como las interpolaciones de grado menor
if resp==1
    % Si el usuario responde que si (presionando 1) se correra el for que
    % incluye la muestra por pantalla de todas las interpolaciones y lso
    % errores aproximados
    for J=1:N
    % Este for hace el calculo de la interpolación, calculando un termino a
    % la vez y acumulando su resultado en una variable
        disp(' '),
        Y=Y+FX(I,J)*FA;
    % Esta formula calcula la diferencia dividida, calculando en cada ciclo
    % el producto de coeficiente por el factor correspondientes y
    % acumulando el resultado
        if J==1
        % Este if muestra por pantalla el primer valor acumulado, y lo
        % marca como f(XI)
            disp(sprintf('f(%0.3f): %0.3f',XI,Y)),
        else
        % A partir del segundo valor se muestra por pantalla f acompañado
        % del orden de la interpolación
            disp(sprintf('f%d(%0.3f): %0.3f',J-1,XI,Y)),
        end
        FA=FA*(XI-X(J));
    % Esta formula calcula el valor del factor actual, acumulando un factor
    % mas en cada ciclo.
        if J>=N
            break,
        % Este if rompe el ciclo cuando el contador alcanza el numero de
        % datos que se posee, e impide el calculo del Error Aproximado, ya
        % que para ese calclo se necesita un dato extra.
        end
        EA=FA*FX(1,J+1);
    % El error aproximado india el marjen de error o equivocación en el
    % valor de la interpolación.
        disp(sprintf('Error Aproximado: %0.3f',EA)),
    % Estos ultimos disp muestras texto y valor de variable al lado, con un
    % desp(sprintf
        disp('--------------'),
    end
else
    % Si el usuario presiona 0 o cualquier otro numero para indicar que No
    % desea ver el error aproximado se corre un for que solo calcula el
    % valor de la interpolación de grado N-1 y lo almacena en la variable Y
    for J=1:N
        % Este for solo hace el calculo de la interpolación, a diferencia
        % del anterior que ademas a ello tambien hacia el calculo de los
        % errores aproximados y mostraba todo por pantalla
        Y=Y+FX(I,J)*FA;
        FA=FA*(XI-X(J));
    end
    % Una ves calculado el valor de la interpolación se termina el for y se
    % muestra por pantalla el resultado
    disp(' '),
    disp(sprintf('   Interpolación de Orden %d',N-1)),
    % Se indica el orden de la interpolación por pantalla, el cual será N-1
    % ya que solo se mostrara la interpolación de mayor grado que se pueda
    % hacer con los datos suministrados por el usuario
    disp(sprintf('f%d(%0.3f): %0.3f',N-1,XI,Y)),
    % se muestra por pantalla f acompañado del orden de la interpolación
    % que en vez de ser J-1 ahora es N-1 ya que toma en cuenta el total de
    % datos suministrados.
end