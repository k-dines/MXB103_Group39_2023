function [result]=Q6(L, k)
H=74; c=0.9; m=80;g=9.81;n=120000; a=0; b=60;alpha=0;beta=0; % Set up vairables
C=c/m; K=k/m; % Calculate set vairables


sizeL = size(L); sizeL = sizeL(2); %get size of arrays
sizeK = size(K); sizeK = sizeK(2); %get size of arrays
result = [0,0];
for iL = 1:sizeL
    for iK = 1:sizeK
        distance = false;
        MaxAccel = false;
        Bounces = true;
        
        f1=@(t,y,v) v;
        f2=@(t,y,v) g-(C.*abs(v).*v)-max(0,(K(iK)*(y-L(iL))));
        
        [t,y,v,h]=RK4_2functions(f1,f2,a,b,alpha,beta,n);
        
        accel=forward_difference_2nd(v,t);
        accel = abs(accel/g);
        gmax=max(accel);

        if gmax < 2
            MaxAccel = true;
        end
        
        lowest_height = H - 1.75 - max(y);
        if (lowest_height > -.05) && (lowest_height < .05)
            distance = true;
        end
        if distance && MaxAccel && distance
            result(end+1,1) = L(iL);
            result(end,2) = k(iK);
        end
        
    end
end
