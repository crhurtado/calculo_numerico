disp('Polinomio de Interpolación de Lagrange'); 
% El comando disp se utiliza para mostrar texto o variables por pantalla
% En este caso el titulo del Programa
START='s';
while (START=='s')
    
    clear all;
    home
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
    % El input combinado con el sprintf permite mostrar texto y variables y
    % leer el valor de una variable en la misma linea, en este caso leemos
    % el valor del vector X en la posición I, en matlab no es necesario
    % declarar las variables y en el caso de los vectores estos se
    % autoexpanden a medida que se llenan los datos
        FX(I)=input(sprintf('f(x%d): ',I-1));
    % Este input lee los valores de Fx, y los almacena todos en la columna
    % uno, Fx, es un arreglo o matriz, en este caso debemos indicar filar y
    % columnas en la variable de la siguiente manera V(f,c)
        disp('--------------');
        L(I)=1;
    % Inicializamos la variable L, al ser un vector, debemos inicializarlo
    % en un for para que todo el vector tome el valor 1, ya que esta
    % variable será un acumulador para calcular el factor Lagrange.
    end

    disp(' ')
    disp('...')
    STOP=input('Presione Enter para continuar');
% Se utiliza una variable extra con un input para pausar la ejecución del
% programa
    home
% Similar al clear all el home limpia el contenido de la pantalla, sin
% embargo, no borra los datos almacenados en las variables

    XI=input('     Ingrese el valor de x que desea interpolar: ');
% Este input solicita un valor intermedio para interpolar, y o guarda en la
% variable XI

    for I=1:N
% Este For en total calcula el valor del factor Lagrange (Li), el primer
% contador I, indica el numero del factor, la posición dentro de la
% Sumatoria.
        for J=1:N
    % El siguiente for anidado mantiene el contador del productor, es el
    % encargado de armar los factores que se van a multiplicar dentro del
    % productor.
            if (I~=J)
        % Se usa if para cumplir la condición de que el valor de I no debe
        % ser el mismo valor de J, ya que si lo fueran, el valor del 
        % numerador de la fracción contenida en el productor daria como
        % resultado 0, y la división entre 0 no existe
                L(I)=((XI-X(J))/(X(I)-X(J)))*L(I);
            % Esta formula es la fracción declarada por Lagrange dentro del
            % productor del factor Li, multiplicada al final por el
            % resultado del ciclo anterior, acumulando asi el resultado de
            % los productos
            end
        end
    end
    
    disp('                    Factores de Lagrange'),
    disp(' ')
    for I=1:N
    % Este for muestra por pantalla los valores de los factores de lagrange
        disp(sprintf('L(%d): %0.3f', I-1,L(I))),
    % El disp muestra los valores de los factores, que se encuentran
    % ubicados en el vector L. Y para mejorar la visual se le agrega un
    % "subindice" de valor I-1.
    end

    for I=1:N
    % En este for se almacena en un vector S, el resultado de las
    % multiplicaciones de L por FX, lo que formará los terminos de la
    % sumatoria.
        S(I)=L(I)*FX(I);
    end

    Y=sum(S);
    % El comando sum, realiza la sumatoria de todo el vector, sin la
    % necesidad de utilizar un for con un acumular para realizar la
    % sumatoria, en la variable Y, almacenamos el valor de esta sumatoria
    % que es en definitiva el valor de la interpolación.
    
    disp(' ')
    disp('                    Valor de la Interpolación'),
    disp(' ')
    disp(sprintf('F%d(%0.2f): %0.3f', N-1,XI,Y)),
    % Este dispo muestra por pantalla el valor de la interpolación asi como
    % el grado de la misma, a modo de "subindice" al lado de la F.
    plot(X,FX,XI,Y,'rs','LineWidth',2,'MarkerSize',4)
    % La instrucción plop dentro de matlab cumple la función de crear y
    % mostrar gráficas de funciones matemáticas establecidas,
    % diferenciandolo esto en mayor medida con las demás herramientas de
    % programación, la sintaxis del plop es plop(variable axisas, variable
    % ordenadas), se pueden dibujar mas de una función dentro de la misma
    % gráfica, declarando las variables por pares dentro del parentesis.

    title('Desarrollo Fisiológico')
    % El comando title agrega a la gráfica un titulo en la parte superior,
    % con el texto que se introduzca dentro de las comilla ssimples
    
    xlabel('Edad (años)')
    % xlabel permite añadir una leyenda en el eje de las abcisas, es decir
    % en el eje horizontal (X)
    
    ylabel('Talla (cms)')
    % Similar a xlabel, el comando ylabel, añade a la gráfica una leyenda
    % en el eje de las ordenadas, es decir el eje vertical (Y).
    
    grid
    % El comando grid añade a la gráfica una cuadrícula para facilitar la
    % comprensión de la misma.

    OtherXI=input('     Desea interpolar otro valor? (s/n): ','s');
    % En este input se lee una variable de acuerdo a la decisión del
    % usuario sobre interpolar otro valor o nó, al agregar al final del
    % input una coma y seguido 's', estamos indicando que lo que se leerá
    % serán letras. 
    
    while OtherXI=='s'
    % Mientras que el usuarió responda que Si a esta pregunta este ciclo
    % repetira los pasos anteriores desde que se ingresa el valor a
    % interpolar hasta que se muestra por pantalla el valor de la
    % interpolación y la gráfica. Con la ayuda de un ciclo repetitivo
    % (bucle) while.
        home
        XI=input('     Ingrese el valor de x que desea interpolar: ');
        for I=1:N
            for J=1:N
                if (I~=J)
                    L(I)=((XI-X(J))/(X(I)-X(J)))*L(I);
                end
            end
        end
    
        disp('                    Coeficientes del Polinomio'),
        disp(' ')
        for I=1:N
            disp(sprintf('L(%d): %0.3f', I-1,L(I))),
        end

        for I=1:N
            S(I)=L(I)*FX(I);
        end

        Y=sum(S);
        disp(' ')
        disp('                    Valor de la Interpolación'),
        disp(' ')
        disp(sprintf('F%d(%0.2f): %0.3f', N-1,XI,Y)),
        
        plot(X,FX,XI,Y,'rs','LineWidth',2,'MarkerSize',4)
        title('Desarrollo Fisiológico')
        xlabel('{Edad (años)}')
        ylabel('Talla (cms)')
        grid

        disp(' ')
        OtherXI=input('     Desea interpolar otro valor? (s/n): ','s');
    end

    START=input('     Desea comenzar de nuevo? (s/n): ','s');
    % La variable START determina el ciclo while que inicia todo el
    % programa, lo que permite reiniciar una interpolación, con otros
    % datos, sin necesidad de abrir de nuevo el programa.
end