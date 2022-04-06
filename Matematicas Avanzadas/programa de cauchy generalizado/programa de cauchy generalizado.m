%IPN ESCUELA SUPERIOR DE COMPUTO
%Alumno: Vaquera Aguilera Ethan Emiliano
%Profesor: GUTIERREZ MEJIA DARWIN
%Grupo: 2CV12
%Segundo programa Formula de Cauchy Generalizada

clearvars all;
close all;

clc; %Limpiador de consola%
syms z; %Creacion de una variable para la diferenciacion del sistema
%%
%Definicion e ingreso de las variables para el sistema y los calculos%

reaz0 = input("Introduce la parte real de z0: ");
imgz0 = input("Introduce la parte imaginaria de z0: ");
n = input("Ingrese el n de la funcion general: ");

reaci = input("Introduce la parte real del centro del circulo: ");
imgci = input("Introduce la parte imaginaria del centro del circulo: ");
radio = input("Introduce el radio del circulo: ");
%%
%Creacion de ciertas operaciones para saber la clase de funcion que necesitamos para hacer la operacion de la derivada%

i = input("Que funcion desea para la derivada:\n1.- ln(z)\n2.- z^n\n3.- e^z\n4.- sinh(z)\n5.- cos(z)\nIngrese: ");
%%

%Calculo para determinar si el punto a sustituir en la funcion esta dentro de la curva

restar = reaz0 - reaci; 
restai = reaz0 - reaci;
zcero = reaz0 + imgz0*1i; %Se usa el sistema de calcular si el vector del punto toca si o no la curva, ademas de ver si esta la sobre pasa sacando su modulo
circun = reaci + 1i*imgci;

mod = sqrt(restar^2 + restai^2);

if (mod>=radio) %De ser que el punto no esta en el sistema se manda la bandera de la funcion a cero y se termina el programa
    i=0;
end
%%
%Aqui podemos ver como el sistema selecciona el tipo de funcion que el ususrio deesea y la deriva la n-1 cantidad de veces que necesitamos%

switch i

    case 1

        fun = log(z);
        deri = diff(fun, n-1);
        disp(deri);

    case 2

        fun = z^n;
        deri = diff(fun, n-1);
        disp(deri);

    case 3

        fun = exp(z);
        deri = diff(fun, n-1);
        disp(deri);

    case 4

        fun = sinh(z);
        deri = diff(fun, n-1);
        disp(deri);
    case 5

        fun = cos(z);
        deri = diff(fun, n-1);
        disp(deri);

end
%**************************************************************************

%%
%Aqui podemos ver como el sistema ve si el punto esta dentro la curva si es que no el sistema simplemente se termina, de no ser este sistema hace los calculos%

clc;

if (i~=0)

    fac = factorial(n-1); %Aqui podemos ver como calculamos el factorial n-1 del sistema ---------------------- !!!!!!! <----------------- factorial 
    zdef = subs(deri,z,zcero); %Ademas sustituimos el punto dentro de la derivada de la funcion

    X = sprintf("Resultado: 2πi/%d(%s) con z= %s", fac, deri, num2str(zcero)); %Aqui imprimimos los valores
    disp(X);

    X2 = sprintf("Resultado definido en el punto: 2πi/%d(%f)", fac, zdef);
    disp(X2);

else

    disp("Punto fuera de la curva");

end 
%%

hold on;
%Impresion de la curva, junto con su centro origen y el punto
%correspondinete que deseamos sustituir z0

axis equal;

plot(zcero, 'o');
plot(circun, 'o');

colors = {'b', 'r', 'g', 'y', 'k'};
centro = [reaci imgci];

viscircles(centro, radio, 'EdgeColor', colors{2}, 'LineStyle', '--');
%***********************************************************************%

hold off;

grid on;

clearvars all;
%%