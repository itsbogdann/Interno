function [] = MidPoint(t0,y0,a,N)
h = a/N;
t(1) = t0 + h;
K1 = f(t0,y0);
K2 = f(t0 + h/2, t0 + h/2 * K1);
y(1) = y0 + h * K2;

for i=1:N-1
    
    K1 = f(t(i),y(i));
    K2 = f(t(i) + h/2, y(i) + h/2 * K1);
    y(i+1) = y(i) + h * K2;
    t(i+1) = t(i) + h;

end

plot(t,y);
hold on,
yex = (t+1).^2 - 1/2 * exp(t);
plot(t, yex, '*r');
p = yex - y


end

function [f] = f(t,y)
    f = y-t^2 + 1;
end
