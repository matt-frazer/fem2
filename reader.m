
%%%%%%%Read from nodes
fid = fopen('nodes.txt','r');
InputText = textscan(fid,'%f %f','delimiter',',');

%populate geometry 
node = [InputText{1},InputText{2}];
nodeCount = length(InputText{1});

%populate support types
%hardcoded for now
node(:,3) = [2; 2; 4; 4; 2];

%populate node dynamics cell array
% TODO initial conditions
nodeDynamics = cell(nodeCount,1);



%%%%%Read from sctr
fid = fopen('sctr.txt','r');
InputText = textscan(fid,'%d %d','delimiter',',');

%populate local/global node mappings
element(:,Node1) = InputText{1};
element(:,Node2) = InputText{2};

%%%%%Read from sctr
%WTF!!!

fid = fopen('props.txt','r');
InputText = textscan(fid, '%f %f %f %f %f %f', 'delimiter',',');%,'whitespace','\n');

element(:,yngModulus) = InputText{1};
element(:,area) = InputText{3};
element(:,density) = InputText{4};
element(:,dampening) = InputText{5};