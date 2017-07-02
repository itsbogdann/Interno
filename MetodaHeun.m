function [] = MetodaHeun(t0,y0,a,N)

h = a/N;
t(1) = t0 + h;
K1 = f(t0,y0);
K2 = f(t0 + h/3, y0 + h/3 * K1);
K3 = f(t0 + 2*h/3, y0 + 2*h/3 * K2);
y(1) = y0 + h/4 * (K1 + 3 * K3);

for i=1:N-1
    
    K1 = f(t(i),y(i));
    K2 = f(t(i)+h/3,y(i) + h/3 * K1);
    K3 = f(t(i) + 2*h/3, y(i) + 2*h/3 * K2);
    y(i+1) = y(i) + h/4 * (K1 + 3 * K3);
    t(i+1) = t(i) + h;
    
end

plot(t,y);
hold on,
yex = (t+1).^2 - 1/2 * exp(t);
plot(t, yex, '*r');
y
p = yex - y

end

function [f] = f(t,y)
    f = y-t^2 + 1;
end



