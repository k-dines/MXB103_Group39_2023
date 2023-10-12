function [t,y,v,h]=RK4_2functions(f1,f2,a,b,alpha,beta,n)
% This fuction will take in input of 2 dependent ODE function (f1, f2) and an intial
% value for each (alpha, beta) and will estimate the solution to those
% functions using the RK4 method over the range a-b
h=abs(b-a)/n;
t=a:h:b;
% initalise the y and v arrays
y=zeros(size(t));
v=zeros(size(t));
% set the first values for y and v
y(1)=alpha;
v(1)=beta;
for i=1:n
    % to estimate the v value using RK4
    p1=h*f2(t(i),y(i),v(i));
    p2=h*f2(t(i)+h/2,y(i),v(i)+p1/2);
    p3=h*f2(t(i)+h/2,y(i),v(i)+p2/2);
    p4=h*f2(t(i)+h,y(i),v(i)+p3);
    v(i+1)=v(i)+1/6*(p1+2*p2+2*p3+p4);
    % to estimate the y value using RK4
    k1=h*f1(t(i),y(i),v(i));
    k2=h*f1(t(i)+h/2,y(i)+k1/2,v(i));
    k3=h*f1(t(i)+h/2,y(i)+k2/2,v(i));
    k4=h*f1(t(i)+h,y(i)+k3,v(i));
    y(i+1)=y(i)+1/6*(k1+2*k2+2*k3+k4);  
end
end