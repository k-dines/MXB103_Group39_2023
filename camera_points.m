function [tCamera, yCamera] = camera_points(t, y, Camera)
% gets the t & y points 2 either side of 'y = camera'
y1 =[];
y2= [];
t1= [];
t2 =[];

reached = false;
lengthT = size(t);


for i = 1:lengthT(2)
    if y(i) >= Camera
        reached = true;
    end

    if ~reached
        y1 = [y1, y(i)];
        t1 = [t1, t(i)];
    else
        y2 = [y2, y(i)];
        t2 = [t2, t(i)];
    end   

end
tCamera = [t1(end-1), t1(end), t2(1), t2(2)];
yCamera = [y1(end-1), y1(end), y2(2), y2(1)];

end
