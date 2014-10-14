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
timeStep = 1; %delta t 
timeStep2 = 0.1; 
timeStep3 = 0.01;
timeStop = 5; %end of for loop


% the three calls to explicit calc at each time increment
uExplicit = explicitCalc(timeStep, timeStop, u, force, m, k, c, initConditions);
uExplicit2 = explicitCalc(timeStep2, timeStop, u, force, m, k, c, initConditions);
uExplicit3 = explicitCalc(timeStep3, timeStop, u, force, m, k, c, initConditions);
 
% Implicit calc at each time step
uImplicit = implicitCalc(timeStep, timeStop, u, force, m, k, c, gamma, beta, initialConditions);
uImplicit2 = implicitCalc(timeStep2, timeStop, u, force, m, k, c, gamma, beta, initialConditions);
uImplicit3 = implicitCalc(timeStep3, timeStop, u, force, m, k, c, gamma, beta, initialConditions);

%Time Axis for ploting
t = 0:timeStep:timeStop;
t2 = 0:timeStep2:timeStop;
t3 = 0:timeStep3:timeStop;

%Plotting Explicit
expDisplacement = uExplicit(1:2:12);
expDisplacement2 = uExplicit2(1:2:102);
expDisplacement3 = uExplicit3(1:2:1002);

hold all; %stacked ploting
plot(t, expDisplacement, 'red');
plot(t2, expDisplacement2, 'blue');
plot(t3, expDisplacement3, 'green');

%Plotting Implicit
impDisplacement = uImplicit(1:2:12);
impDisplacement2 = uImplicit2(1:2:102);
impDisplacement3 = uImplicit3(1:2:1002);

figure(2);
hold all; %stacked ploting
plot(t, impDisplacement, 'red');
plot(t2, impDisplacement2, 'blue');
plot(t3, impDisplacement3, 'green');
