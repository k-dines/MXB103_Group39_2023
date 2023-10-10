function [s]=simpson(v,t)
% EDIT NEEDED: Comments, what does do?
% This Function 
[~, l]=size(t);
if l==1
    h=t;
elseif rem(l,2)==0
    error("the t array must have an odd number of terms for simpsons rule to work")
else
    warning("all t values must be equally distance for this result to be vaild")
    h=t(2)-t(1);
end
even_terms=0;
for i=1:((l-1)/2-1)
    even_terms=even_terms+v(2*i+1);
end
odd_terms=0;
for i=1:((l-1)/2)
    odd_terms=odd_terms+v(2*i);
end
s=h/3*(v(1)+4*odd_terms+2*even_terms+v(end));
end