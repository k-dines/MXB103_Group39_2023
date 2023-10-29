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
% 10/10
    % Q4 was solved and the function simpsons was created 
%% Notes:
% IMPORTANT: In accordence with section 6 on the task sheet, 5 functions
% need to be created, the first 3 are done and included on the github but
% there are 2 more that still need to be made, one for interpolation (Used in quesion 5) and
% one for root finding (Used in question 6)

% Euler_2functions is not used in this document but can be used instead of
% RK4_2functions for error checking purposes

% All point labeled with EDIT NEEDED need to be edited at some point        
% (use ctrl+f to find them) [None as of 12/10]
%% Inputs
H=74; % Height that will be jumped from
D=31; % Height of the deck
c=0.9; % Drag Coeffient
m=80; % mass of jumper
L=25; % length of rope
k=90; % spring constant of rope
g=9.81; % earths gravity
C=c/m; 
K=k/m;
n=120000; % number of subintervals (2000 intervals per second [could be lowered if required])
a=0; % initial time
b=60; % final time
alpha=0; % initial height y=0
beta=0; % initial velocity v=0
f1=@(t,y,v) v;
f2=@(t,y,v) g-(C.*abs(v).*v)-max(0,(K*(y-L)));
% Clear unused/excess variables
clear c  k 


%% Q1
% NOTE: y=0 is the bridge

[t,y,v,h]=RK4_2functions(f1,f2,a,b,alpha,beta,n);
figure; plot(t,-y) 
xlabel time(s); ylabel displacement(m); title("displacement over time of the bungee jumper");



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
speed=abs(v);
figure; plot(t,speed)
xlabel time(s); ylabel speed(m/s); title("speed of the jumper at a given time")

% Max speed occurs around t=2.6
% Checking the array max_speed=20.0277
% NOTE: Can also use the zoom in fuction or change the axis range to find
% the answer

max_speed=max(speed) % I mean this also works??
% If you want I could make my own function to do this
%% Q3
% NOTE: Uses the v and t arrays from Q1 and the g value
accel=forward_difference_2nd(v,t);
accel = abs(accel/g);
figure; plot(t,accel)
xlabel time(s); ylabel Acceleration(g); title("Absolute Acceleration of the jumper at a given time")
gmax=max(accel) % gmax = 1.8711g
% no It does not exceed 2g

%% Q3 Check
% NOTE: This should most likely be removed from the final
accel_check=zeros(1,length(v)-1);
for i=2:length(v)
    accel_check(i)=(v(i)-v(i-1))/(t(i)-t(i-1));
end
gmax_check1=max(abs(accel_check))/g
gmax_check2=max(abs(f2(t,y,v)))/g
% Agrees with previous answers





%% Q4 
% abs(v) (or speed) needs to be used as we are looking for distance rather
% than displacement 
total_distance=simpson(abs(v),t)

%% Q5
% NOTE: This should be able to be completed with an interpolation function
Camera = H-D;

[tCamera, yCamera] = camera_points(t, y, Camera); % get points either side of Camera height
%x = 100;
%yCamera1 = lagrange(X, Y, x); 




%T5 = [3.3305,3.3315,3.332,3.3325];
%H5 = [42.9832,42.9981,43.005,43.013];

%displaced 

% time is arround 2.66 seconds

%% Q6
% NOTE: This should be able to be completed with a root finding function

%{
L=25; % length of rope
k=90; % spring constant of rope
K=k/m;


[t,y,v,h]=RK4_2functions(f1,f2,a,b,alpha,beta,n);


temp = H-1.57;
figure; plot(t,temp-y) 
xlabel time(s); ylabel height(m); title("Height of the bungee jumper");

lowest_height = temp - max(y)
%}
figure; plot(t,H-y) 
xlabel time(s); ylabel height(m); title("Height of the bungee jumper");

