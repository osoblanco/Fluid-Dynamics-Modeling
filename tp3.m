function y = tp3(f,g,p1,p2,rt)
nx = 100; %We divide the interval [p1,p2] into nx parts
nt = 5000; %We divide the time interval [0,rt] into nt parts
dx = (p2-p1)/nx; %the length of x-subintervals, x-step
dt = rt/nt; %the length of t-subintervals, t-step
x = p1:dx:p2; %the x-axis division points
t = 0:dt:rt; %the t-axis division points

%Initialization
for m = 1:nx+1
    a(1,m) = f(p1+(m-1)*dx);% filling the first row, the initial data
end

%Calculation
for j = 1:nt
    for i = 1:nx
        a(j+1,i) = dt*g(p1+(i-1)*dx,(j-1)*dt)*(a(j,i+1)-a(j,i))/(dx) + a(j,i); %filling array by 3points
    end
end

%Plotting now
for i =1:nt
	pause(0.0004);
	plot(x,a(i,:),'LineWidth',2);
	axis([p1 p2 -2 2]) %To fix the axis lengths
end

end
