function [ ] = tema2ec()
    c = 2 + 0.69;
    tfin = 10;
    
    t = linspace(0.1, tfin);
    y = (c - log(t))./t;
        
    plot(t, y, 'b', 'Linewidth',2);
    hold on
    
    plot(2,1,'or','Linewidth',3);
    plot(0 * ones(100), linspace(0,10,100),'b');
end

