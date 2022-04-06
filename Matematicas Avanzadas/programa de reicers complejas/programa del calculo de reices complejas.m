%IPN ESCUELA SUPERIOR DE COMPUTO
%Alumno: Vaquera Aguilera Ethan Emiliano
%Profesor: GUTIERREZ MEJIA DARWIN
%Grupo: 2CV12
%Primer programa raices complejas

clc; %Limpiador de consola%

cont=0; %Contador que se usa dentro del while pára la operacion de la raiz%

%***********************************************************%
rea = input("Introduce la parte real: ");
img = input("Introduce la parte imaginaria: ");
num = input("Introduce el numero de raices que desea: ");
%Ingreso de datos para la parte ral e imaginaria y de igual manera se pide la n raiz que se desea hacer% 

%*********************************%
mod = sqrt((img)^2 + (rea)^2);
gra1 = img/rea;
gra2 = atan(gra1);
%Calculo del modulo y la arcotangente%

hold on; %Funcion que permite la ingresacion sucesiva de datos
    while cont<num %Contador se detendra a un n
        %Calculo de coseno y seno de manera normal dentro de variable
        cose = (gra2+(360*cont))/num;
        sine = (gra2+(360*cont))/num;
        %*****************************************************%
        
        %Calculo de la raiz n potencia de nuestro numero imaginario%
        z = ((mod)^1/num)*(cos(cose)+ 1i*sin(sine));
        %***********************************************************%
        
        %Inghreso de la prte real del numero imaginario y la parte
        %imaginaria a dos variables x,y
        x = real(z);
        y = imag(z);
        %********************************************************
        
        cont = cont + 1;
        disp(z); %Muestra del resultado de nuestra operacion%
        
        %Dibujado de plano cartesiano
        a = [-5 5];
        b=a-a;
        %****************************%
        
        %Determinacion del radio para circulo%
        mod2 = sqrt((x)^2 + (y)^2);
        %*********************************%
        
        %Dibujado de eje x y eje y%
            plot(a,b);
            plot(b,a);
        %**************************%
        
        %Dibujado de el punto imaginario de la raiz n%
            scatter(x,y);
        %********************************************%

    end
    
%Calculo de theta para circulo en radio mod2%
theta = linspace(0,2*pi);
%******************************************$
%Calculo de los puntos de radio y tamaño del circulo%
x1 = mod2*cos(theta);
y1 = mod2*sin(theta);
%***************************************************%
%Impresion del circulo con ayuda de axis equals que ayuda a determinar la
%parte circilar de manera rapia%
plot(x1,y1);
axis equal;
%***********************************************************************%
   
hold off;
grid on;

pause;
clc;