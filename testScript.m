clear all;

%Test values these will be populated using the text files with the
%corresponding conditions.

%q1 hardcoded vals (20002 is number of timesteps for largest case)
u = zeros(20002 , 1);
c = [1 0 ; 0 1];
k = [10 0 ; 0 10];
m = [10, 0 ; 0 10];
initConditions = [0 ; 0]; %explicit Q1
initialConditions = [ 0, 0 ; 0, 0 ; 0, 0 ]; % implicit 1 ..row 1 = Pos , r2 = Vel r3 = Acc Cols(x,y)
gamma = 3/2;
beta = 8/5;
% for the explicit calc we pass in  a matric of the values of the forces at that point
force = zeros(20002, 1);

%alternates x/y
for a = 1:2:20002
    force(a) = 10;
    force(a+1) = 0;
end

% timeSteps and StopTime populated based on question perhaps? 
e = 0.1; %delta t 
e2 = 1;
e3 = 0.01;
timeStop = 5; %end of for loop


% the three calls to explicit calc at each time increment
% u3 = explicitCalc(e3, timeStop, u, force, m, k, c, initConditions);
% u2 = explicitCalc(e2, timeStop, u, force, m, k, c, initConditions);
% u = explicitCalc(e, timeStop, u, force, m, k, c, initConditions);
 
% Implicit calc at each time step
u3 = implicitCalc(e3, timeStop, u, force, m, k, c, gamma, beta, initialConditions);
u2 = implicitCalc(e2, timeStop, u, force, m, k, c, gamma, beta, initialConditions);
u = implicitCalc(e, timeStop, u, force, m, k, c, gamma, beta, initialConditions);

%axis for ploting
t = 0:e:timeStop;
t2 = 0:e2:timeStop;
t3 = 0:e3:timeStop;

%geting the X displacements for plotting
ux = u(1:2:102);
ux2 = u2(1:2:12);
ux3 = u3(1:2:1002);

%stacked ploting
hold all;
plot(t, ux, 'red');
plot(t2, ux2, 'blue');
plot(t3, ux3, 'green');
