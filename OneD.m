function [  ] = OneD(f, c0, t, a, b)
n = 100;
step = (b-a) / n;
k = 0;

while(k<=t)
    x = [a+k zeros(1,n)];
    y=[f(a+k-k*c0) zeros(1,n)];

    for i=1:n
        y(i+1)= f(x(i)-k*c0) ;
        x(i+1)=x(i)+step;
    end
    pause(0.000000002)
    k1=[k k*ones(1,n)];
    plot3(x,k1,y,'b')
    xlabel('x'); ylabel('time'); zlabel('y');
    hold on
    k=k+0.01;
end

end
Published with MATLAB® R2015a
