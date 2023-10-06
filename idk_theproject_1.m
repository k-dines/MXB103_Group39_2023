%% Edits
% 5/10
    % euler_2functions.m was updated to use modified euler rather than the
    % orginal euler function
    % alpha was changed to 0 as the intial displacement is 0, fixed issue
    % with jumper going underwater
% 6/10 
    % Q3 was finished and function forward_difference_2nd was created to
    % solve it
    % Some general fixes so there should be no errors with code from
    % Q1-3 (emphasis on should)

% All point labeled with EDIT NEEDED need to be edited at some point        
% (use ctrl+f to find them)
%% Inputs
% EDIT NEEDED: all values should be labeled for better understanding
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
alpha=0; %initial height y=0
beta=0; %initial velocity v=0
f1=@(t,y,v) v;
f2=@(t,y,v) g-(C.*abs(v).*v)-max(0,(K*(y-L)));
% Clear unused/excess variables
clear c  k 
%% Q1
% NOTE: y=0 is the bridge

% Either method works, euler is easier to modify to work for 2 functions
% then RK4 but RK4 is more acurrate 
% [t,y,v,h]=euler_2functions(f1,f2,a,b,alpha,beta,n);
% figure; plot(t,-y)

[t,y,v,h]=RK4_2functions(f1,f2,a,b,alpha,beta,n);
figure; plot(t,-y)
% EDIT NEEDED: Plot should have title and axis labels

% a bounce could be concidered a bounce when acelleration is 0 and
% velocity is postive
% NOTE: This could be done by graphing f1 and f2 and seeing when the graph
% meet those conditions

% NOTE: This currently doesn't produce the correct result, it will be
% better to just use the grpah
% w=zeros(1,length(t));
% for i=1:length(t)
%     if f2(t(i),y(i),v(i))>-0.001597 && f2(t(i),y(i),v(i))<0.001598 && v(i)>0
%         w(i)=1;
%     end
% end
% total_bounces=sum(w)
%% Q2
% NOTE: Uses the v and t arrays from Q1
% NOTE: abs(v) is used to check for max speed rather than velocity 
s=abs(v);
figure; plot(t,s)
% EDIT NEEDED: Plot should have title and axis labels

% Max speed occurs around t=2.5
% Checking the array max_speed=20.0277

max(s) % I mean this also works??
% If you want I could make my own function to do this
%% Q3
% NOTE: Uses the v and t arrays from Q1 and the g value
accel=forward_difference_2nd(v,t);
gmax_accel=max(accel)/g
%% Q3 Check
accel_check=zeros(1,length(v)-1);
for i=2:length(v)
    accel_check(i)=(v(i)-v(i-1))/(t(i)-t(i-1));
end
gmax_check1=max(accel_check)/g
% no It does not exceed 2g
gmax_check2=max(f2(t,y,v))/g
% Agrees with previous answers
% answer cannot be calucate atm but should be simillar to these answer
%% Q4 
% NOTE: This has not been covered but probabily done with simpsons rule

%% Q5

