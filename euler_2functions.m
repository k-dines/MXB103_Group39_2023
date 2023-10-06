function [t,y,v,h]=euler_2functions(f1,f2,a,b,alpha,beta,n)
% This fuction will take in input of 2 dependent ODE function (f1, f2) and an intial
% value for each (alpha, beta) and will estimate the solution to those
% functions using the modified eular method (lies this is normal euler) over the range a-b
h=(abs(b-a))/n;
t=a:h:b;
y=zeros(size(t));
v=zeros(size(t));
y(1)=alpha;
v(1)=beta;
for i=1:n
    k1=h*f1(t(i),y(i),v(i));
    k2=h*f1(t(i+1),y(i)+k1,v(i));
    y(i+1)=y(i)+1/2*(k1+k2);
    p1=h*f2(t(i),y(i),v(i));
    p2=h*f2(t(i+1),y(i),v(i)+p1);
    v(i+1)=v(i)+1/2*(p1+p2);
end
end