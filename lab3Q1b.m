
%Q1  (B) Write a MATLAB program to solve the equations using N-R iterations.


%initial variables
num=0;

x1=1.5;             %initial guess
x2=1.5;             %initial guess
xo=[x1;x2];
X=xo;               %variable to matrix  1x2 for initial guess
thr = 10e-15;       %<--Define Threshold here
MaxItr =10;
m=1;

%empty vector to store the variables from iteration
xIter=[];   %vector of the number of iterations
xD=[];      %iteration values
xF=[];


%Newton-Raphson iterations until the norms of the 12
%both errors ||∆x|| and ||Φ(x)|| become less than 10−15.
while num < MaxItr
    
    
    %equations  Q1-A (variable x)
    func1=3*X(1)-5*X(2)-2*X(2)^2+15;
    func2=-3*X(1)+2*X(2)+2*X(1)^2+X(2)^2-7;
    
    %derivative / jacobian matrix
    dervf1=0-func1;
    dervf2=0-func2;
    dervF=[dervf1;dervf2];
    J1=3;
    J2=-5-4*X(2);
    J3=-3+4*X(1);
    J4=2+2*X(2);
    JacF=[J1 J2;J3 J4];
    dx=inv(JacF)*dervF;
    
    X=X+dx;
    if max(max(norm(dx)),max(norm(dervF))) < thr
        break;
    end
    
   
    num=num+1;
    xIter(num)=num;
    xD(num)=max(norm(dx));
    xF(num)=max(norm(dervF));
    
    
    
end
%--------------------------------------
% Display the Results
%--------------------------------------
%display number of iteration processed to get solution
fprintf('Num of NR-itr: %d\n\n',num);

disp('The x1 and x2 values =');

format short e
disp(X)
format
disp('DONE!')

%plot 
figure (2)
plot(xIter,xD)
title(' Q1 (B) norms or error delta(x) vs number of iterations')
xlabel('number of Iterations x-axis')
%ylim([-0.65 0.65])

figure (3)
plot(xIter,xF)
title(' Q1 (B) norms or error phi(x) vs number of iterations')
xlabel('number of Iterations x-axis')
%ylim([-0.65 0.65])


