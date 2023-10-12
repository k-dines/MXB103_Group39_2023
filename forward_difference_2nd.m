function a=forward_difference_2nd(v,t)
% This function takes in an array v and uses the second forward difference
% to approximate a differenciation at all the points in v and outputs them
% in the array a
% the t array is used to calculate the value h which is the intervals
% between the v values.

[~, l]=size(t);
if l==1
    h=t; % if t is not an array it is used as the h value
else
    warning("all t values must be equally distance for this result to be acurate")
    h=t(2)-t(1);
end
a=zeros(size(v)); % initalise the a array
% apply the 2nd forward difference
for i=1:length(v)-2
    a(i)=(-3*v(i)+4*v(i+1)-v(i+2))/(2*h);
end
% second forward difference cannot calulate the final 2 values so they will
% be calculated using the central difference for the second to last value
% and the 1st order backward difference for the last value

a(end-1)=(v(end)-v(end-2))/(2*h);
a(end)=(v(end)-v(end-1))/h;
end