%IPN ESCUELA SUPERIOR DE COMPUTO
%Alumno: Vaquera Aguilera Ethan Emiliano
%Profesor: GUTIERREZ MEJIA DARWIN
%Grupo: 2CV12
%Residuo de una funcion

clearvars all;
close all;

clc; %Limpiador de consola%
syms z; %Creacion de una variable para la diferenciacion del sistema
%%
%Definicion e ingreso de las variables para el sistema y los calculos%
tot1 = 0;
tot2 = 0;
tot3 = 0;

n = input("Ingrese el n del z: ");
a = input("Introduce el numero de a: ");
b = input("Introduce el numeor para b: ");

p = input("Introduce el exponente p: ");
q = input("Introduce el exponente q: ");
s = input("Introduce el exponente s: ");

r = input("Introduce el radio de la circunferencia: ");

clc;
ffun =  (z^n)/( ((z-1i*a)^p)*((z-1i*b)^q)*((z-3i)^s) );
disp("Funcion totalmente construida en base a las variables: ");
disp(ffun);
disp('*************************************************************************');

%%
%Calculos para la parte de la el residuo y determinar si esata funcio puede
%indeterminarse

%Calculos que se hacen para determinar el valor de total uno%
if (a ~= b && a ~= 3 && b ~= 3)
    if(a < r)
    
        fun =  (z^n)/(((z-1i*b)^q)*((z-3i)^s));
        disp(fun);
        deri = diff(fun, p-1); 
        disp(deri);
        zdef = subs(deri,z,a*1i); %Ademas sustituimos el punto dentro de la derivada de la funcion
        disp(zdef);
        fac = factorial(p-1);
        tot1 = (2*pi*1i)*(fac*(zdef));
        disp('Hasta aqui total 1: ');
        disp(tot1);
        disp('*************************************************************************');
    
    elseif(a == r)
    
        disp('Error la ecuacion se indetermina');
        disp('*************************************************************************');
    
    else 
    
        disp('El numero no se encuentra dentro de la indeterminacion');
        disp('*************************************************************************');
    
    end
    
    %Calculos que se hacen para determinar el total 2%
    
    if(b < r)
    
        fun =  (z^n)/(((z-1i*a)^p)*((z-3i)^s));
        disp(fun);
        deri = diff(fun, q-1); 
        disp(deri);
        zdef = subs(deri,z,b*1i); %Ademas sustituimos el punto dentro de la derivada de la funcion
        disp(zdef);
        fac = factorial(q-1);
        tot2 = (2*pi*1i)*(fac*(zdef));
        disp('Hasta aqui total 2: ')
        disp(tot2);
        disp('*************************************************************************');
    
    elseif(b == r)
    
        disp('Error la ecuacion se indetermina');
        disp('*************************************************************************');
    
    else 
    
        disp('El numero no se encuentra dentro de la indeterminacion');
        disp('*************************************************************************');
    
    end
    
    if(3 < r)
    
        fun =  (z^n)/(((z-1i*a)^p)*((z-1i*b)^q));
        disp(fun);
        deri = diff(fun, s-1); 
        disp(deri);
        zdef = subs(deri,z,3i); %Ademas sustituimos el punto dentro de la derivada de la funcion
        disp(zdef);
        fac = factorial(s-1);
        tot2 = (2*pi*1i)*(fac*(zdef));
        disp('Hasta aqui total 3: ')
        disp(tot2);
        disp('*************************************************************************');
    
    elseif(3 == r)
    
        disp('Error la ecuacion se indetermina');
        disp('*************************************************************************');
    
    else 
    
        disp('El numero no se encuentra dentro de la indeterminacion');
        disp('*************************************************************************');
    
    end
else 
    
    disp('La funcion se indetermina');

end

%%

total = tot1 + tot2 + tot3;
disp('Total totaloso: ');
disp(total);

%%

hold on;
%Impresion de la curva, junto con su centro origen y el punto
%correspondinete que deseamos sustituir z0

axis equal;

plot(a*1i, 'o');
plot(b*1i, 'o');
plot(3i, 'o');

colors = {'b', 'r', 'g', 'y', 'k'};
centro = [0 0];

viscircles(centro, r, 'EdgeColor', colors{2}, 'LineStyle', '--');
%***********************************************************************%

hold off;

grid on;

clearvars all;
%%

