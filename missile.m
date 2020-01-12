%Sofiya Markova 

%goal of code: 

%simulate a missile on a directed trajectory towards an airplane


function missile = missile(Va,Vm,XStartM,YStartM, Tstep) 


%setting variables
%t starts at 0 sec
t = 0;
%set the start for missile (x,y) as what start coordinates are (later will add on to it)
Xm = XStartM;
Ym = YStartM;
%create vectors to store x and y values of missile (so can plot them all later)
xVector = [];
yVector = [];

%y of airplane not change is always y=0. x needs to be set to 0 so starting
%point for airplane is (0,0)
Xa= 0;

%create function AMDiff at start defining using variables have. AMDiff
%represents distance between the missile and airplane
AMDiff = ((Xm-Xa)^2) + (Ym^2);
AMDiff = sqrt(AMDiff);

%while goes until 100 sec passed (so time bound if nothing happens, loop will terminate after certain amount of time)
%or until AMDiff become sless than 50 which defined as airplane and missile
%collide 
while t<100 && (AMDiff)>50
    
    
%AMDiff in loop so keeps updating    
AMDiff = ((Xm-Xa)^2) + (Ym^2);
AMDiff = sqrt(AMDiff);
    
%updating Xa. x-coordinate of airplane as it flies so missile tracks where to fly to (no update for y-coordinate because always stays 0)
Xa = Xa + (Tstep * Va);    
    
%updating Xm. x-coordinate of missile as it flies
Xm = Xm -( (Tstep*Vm)* (Xm-Xa) )/AMDiff;
%updating Ya. y-coordinate of airplane as it flies
Ym = Ym - ( (Tstep*Vm) * (Ym) )/ AMDiff;

%time updated so next loop sees where missile is after a time step
t = t+1;
%save x and y values of missile into vectors (so can then plot all points missile)
xVector(t) = Xm;
yVector(t) = Ym;
end

%displays if missile hit plane or not and when the missile hits if it does
if(AMDiff<50)
    display('mission complete end time'); 
    display (t);
       
else
    display('mission failed');
end

%drawing a plot of missile trajectory according to instructions on plots
plot (xVector, yVector);
grid
xlabel('x-coordinate of missile');
ylabel('y-coordinate of missile');
title ('missile trajectory');
