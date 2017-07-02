function [] = MetodaR_K_4(t0,y0,a,N)

h = a/N;
t(1) = t0 + h;
K1 = f(t0,y0);
K2 = f(t0 + h/2, y0 + K1/2);
K3 = f(t0 + h/2, y0 + K2/2);
K4 = f(t0 + h, y0 + K3);
y(1) = y0 + h/6 * (K1 + 2 * K2 + 2 * K3 + K4);

for i=1:N-1
    
    K1 = f(t(i),y(i));
    K2 = f(t(i) + h/2, y(i) + K1/2);
    K3 = f(t(i) + h/2, y(i) + K2/2);
    K4 = f(t(i) + h, y(i) + K3);
    y(i+1) = y(i) + h/6 * (K1 + 2 * K2 + 2 * K3 + K4);
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

