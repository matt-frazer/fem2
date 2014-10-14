clear all;

% Node Enumeration
x = 1;
y = 2;
supportType = 3;
%valueMatrix = 4; % make me a matrix
forceId = 4; %


%Force Enumeration
magnitude = 1;
dir = 2;
forceId = 3;


% Element
yngModulus  = 1;
area = 2;
Node1 = 3; %make me a vector
Node2 = 4;
dampening = 5;
stressMag = 6;
stressDir = 7;
density = 8;

%Support
fixed = 1;
yRoller = 2;
xRoller = 3;
free = 4;

node = [];
force = [];
element = [];

run('reader.m');