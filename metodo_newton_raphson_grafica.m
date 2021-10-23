clc;
fprintf("%s", "METODO DE NEWTON RAPSHON\n");

#tambien se puede utilizar f = input("escribe la funcion", "s")
f = @(x)x^2 - (2*x)*e^(-x) + e^(-2*x);
#f = inline(f);

d = @(x)2*x -2*(e^(-x)- x*e^(-x)) - 2*e^(-2*x);
#d = inline(d);

maximoIteracion = input("maximo de iteraciones: ")

#valor inicial de x sub i 
xi = 0;
vector = [];
i=1;
#funcion que retorna el error aproximado
function ea = errora(xa, xp)
    ea = abs(((xa - xp)/xa)*100);
end

if d(xi) == 0
     fprintf ("%s", "no se puede hallar una raiz");

     else
        xn = xi - ( f(xi)/d(xi) );
        fprintf("____________________________________________\n");
        fprintf("%s\t\t %s\t\t  %s\n",'I','XN','|EA|  ');
        fprintf("____________________________________________\n");
          
        while i < maximoIteracion
            fprintf("%.0f\t\t", i);
            fprintf("%.8f\t", xn);
            vector(i) = xn;
            fprintf("%.8f\t", errora(xn, xi));
            fprintf("\n");
            xi = xn;
            xn = xi - ( f(xi)/d(xi) );
            i++;
        endwhile
        
        vector(i) = xn;
        fprintf("%.0f\t\t", i);
        fprintf("%.8f\t", xn);
        fprintf("%.8f\t", errora(xn, xi));
        fprintf("\n");
              
        fprintf("____________________________________________");
        fprintf("\nLA RAIZ APROXIMADA ES: %.8f\n", xn);
        fprintf("\nf(x) = %.4f\n", f(xn));
                
        for i=1:length(vector)
            fprintf("\n vector[%.0f]= %.4f" ,i ,vector(i))
        endfor 
        
        fprintf("\n");
        
        x = linspace(vector(1), vector(length(vector)), 50);
        y = x.^2 - (2.*x).*(e.^(-x)) + e.^(-2.*x);
        subplot(2, 2, 1)
        plot(x, y)
        #grafica derivada
        x = linspace(vector(1), vector(length(vector)), 50);
        d = 2.*x -2.*(e.^(-x)- x.*e.^(-x)) - 2.*e.^(-2.*x);
        subplot(2, 2, 2)
        plot(x, d)
        
endif