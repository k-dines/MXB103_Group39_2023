%% Inputs
% NOTE: This section will clear the workspace
clear
H=74;
D=31;
c=0.9;
m=80;
L=25;
k=90;
g=9.81;
C=c/m;
K=k/m;
n=120000;
a=0; %initial time
b=60; %final time
alpha=H; %initial height
beta=0; %initial velocity
f1=@(t,y,v) v;
f2=@(t,y,v) g-(C.*abs(v).*v)-max(0,(K*(y-L)));
%% Q1
% NOTE: Answer is not 100% correct as the jumper goes below sea level
% Either method works, euler is easier to modify to work for 2 functions
% then RK4 but RK4 is more acurrate 
% [t,y,v,h]=euler_2functions(f1,f2,a,b,alpha,beta,n);
% figure; plot(t,y)
[t,y,v,h]=RK4_2functions(f1,f2,a,b,alpha,beta,n);
figure; plot(t,y)
% a bounce could be concidered a bounce when acelleration is 0 and
% velocity is postive
% NOTE: This could be done by graphing f1 and f2 and seeing when the graph
% meet those conditions, Both methods are a bit dodgy
w=zeros(1,length(t));
for i=1:length(t)
    if f2(t(i),y(i),v(i))>-0.002 && f2(t(i),y(i),v(i))<0.002 && v(i)>0
        w(i)=1;
    end
end
total_bounces=sum(w)
%% Q2
% NOTE: Uses the v array from Q1
% NOTE: abs(v) is used to check for max speed rather than velocity 
s=abs(v);
figure; plot(t,s)
% Max speed occurs around t=1.275
% Checking the array max(s)=34.0775
max(s) % I mean this also works??
% If you want I could make my own function to do this
%% Q3
% NOTE: This is not done the right way as it is covered in week 10
% NOTE: uses arrays from Q1
a=zeros(1,length(v)-1);
for i=2:length(v)
    a(i)=(v(i)-v(i-1))/(t(i)-t(i-1));
end
gmax=max(a)/g
% no It does not exceed 2g
%% Q3 Check
gmax_check=max(f2(t,y,v))/g
% Agrees with previous answers
% answer cannot be calucate atm but should be simillar to these answer
%% Q4 
% NOTE: This has not been covered but probabily done with simpsons rule

%% Q5
% Make lenght = 30
