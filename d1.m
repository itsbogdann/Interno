function [] = MetodaEuler ()

N = 10;
a = 2;
h = a/N;
t0 = 0;
y0 = 0.5;

f = inline('y-t^2+1','t','y');
t(1) = t0 + h;
y(1) = y0 + h * f(t0,y0);

for i=1:N-1
    
    t(i+1) = t(i) + h;
    y(i+1) = y(i) + h * f(t(i),y(i));
    
    
end

plot(t,y);
y
yex = (t+1).^2 - 1/2 * exp(t);
hold on,
plot(t, yex, '*r');
p = yex - y

end

