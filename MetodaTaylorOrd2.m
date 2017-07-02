function [] = MetodaTaylorOrd2 ()

N = 10;
a = 2;
h = a/N;
t0 = 0;
y0 = 0.5;
t(1) = t0 + h;
y(1) = y0 + h * f(t0,y0)

y2(1) = y0 + h * T2(t0,y0,h);
y4(1) = y0 + h * T4(t0,y0,h);

for i=1:N-1
    y2(i+1) = y2(i) + h * T2(t(i),y2(i),h);
    y4(i+1) = y4(i) + h * T4(t(i),y4(i),h);
    t(i+1) = t(i) + h;
end

yex = (t+1).^2 - 1/2 * exp(t);
y4
figure
plot(t,y2);
hold on,
plot(t,y4,'g');
plot(t,yex,'r');

figure
plot(t, abs(y2-yex),'g');
hold on,
plot(t, abs(y4-yex),'r');
p1 = yex - y2
p2 = yex - y4

end

function [f] = f(t,y)
    f = y-t^2 + 1;
end


function [f1] = f1(t,y)
    f1 = y-t^2 - 2*t + 1;
end

function [f2] = f2(t,y)
    f2 = y-t^2 - 2*t - 1;
end

function [f3] = f3(t,y)
    f3 = y-t^2 - 2*t - 1;
end

function [T2] = T2(t,y,h)
    T2 = f(t,y) + f1(t,y) / 2 * h;
end

function [T4] = T4(t,y,h)
    T4 = T2(t,y,h) + f2(t,y)/6 * h^2 + f3(t,y)/24*h^3;
end
