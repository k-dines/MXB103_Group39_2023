function [s]=simpson(v,t)
% This Function takes in input array v and use simpsons rule to estimate
% the area over the whole array, this value will be outputed as the
% variable s
[~, l]=size(t);
if l==1
    h=t; % if t is not an array it is used as the h value
elseif rem(l,2)==0 % test to see if the array v has an odd number of terms
    error("the t array must have an odd number of terms for simpsons rule to work")
else
    warning("all t values must be equally distance for this result to be vaild")
    h=t(2)-t(1);
end
even_terms=0; % initalise the even terms
% calculate the sum of the even terms
for i=1:((l-1)/2-1)
    even_terms=even_terms+v(2*i+1);
end
odd_terms=0; % initalise the odd terms
% calculate the sum of the odd terms
for i=1:((l-1)/2)
    odd_terms=odd_terms+v(2*i);
end
% apply simpsons rule
s=h/3*(v(1)+4*odd_terms+2*even_terms+v(end));
end