function y = tp1(f,g,p1,p2,rt)
nx = 100; %We divide the interval [p1,p2] into nx parts
nt = 5000; %We divide the time interval [0,rt] into nt parts
dx = (p2-p1) / nx; %the length of x-subintervals, x-step
dt = rt / nt; %the length of t-subintervals, t-step
x = p1:dx:p2; %the x-axis division points
t = 0:dt:rt; %the t-axis division points

%Initialization
for m = 1:nx+1
    a(1,m) = f(p1+(m-1)*dx);% filling the first row, the initial data
end

%Calculation
for j = 1:nt
    for i = 2:nx
        a(j+1,i) = dt*g(p1+(i-1)*dx,(j-1)*dt)*(a(j,i+1)-a(j,i-1))/(2*dx) + a(j,i); %filling array by 3points
    end
        a(j+1,1) = a(j+1,2); %not the best way to calculate at the endpoints
        a(j+1,nx) = a(j+1,nx-1);%not the best way to calculate at the endpoints
end
a(i,:);

for i =1:rt
    axis([p1 p2 -2.5 2.5])  %To fix the axis lengths
    t1=[t(i) t(i)*ones(1,nx)];
    pause(0.002);
    plot3(x,a(i,:),t1);
    xlabel('x'); ylabel('time'); zlabel('y');
    hold on
end

end
