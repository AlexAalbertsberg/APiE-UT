clear all
clc

%specify truss dimensions (square)
dim = 100;
sqrtdim = sqrt(dim); % #columns&rows

%initialize positions and velocities at t = 0
r0 = zeros(dim,2);
v0 = zeros(dim,2);
% initialize empty connectivity matrix
C = zeros(dim, dim);

v0(dim,:) = [0 1];

%initial positions (i,j)
for i = 1:sqrtdim
    for j = 1:sqrtdim
        r0((i-1)*sqrtdim+j,:) = [i j];        
    end
end

%fill connectivity matrix
%horizontal neighbors
for i = 1:dim
   if(mod(i,sqrtdim) ~= 0)
       C(i,i+1) = 1;
       C(i+1,i) = 1;
   end
end
%vertical neighbors
for i = 1:dim-sqrtdim
   C(i,i+sqrtdim) = 1;
   C(i+sqrtdim,i) = 1;
end
% each point is connected to itself
for i = 1:dim
   C(i,i) = 1; 
end

m = 2; %mass

%Simulation parameters
tf = 100;
dt = 0.1;

nt = tf/dt; %number of time steps


% Preallocation of time, solution and velocity matrices
t = zeros(1,nt+1);
r = zeros(dim,2);
v = zeros(dim,2);

% Initialize loop variables
r = r0 - dt*v0;
rnext = r0;

% get plot coordinates for initial positions
[xd,yd] = gplot(C,r0);
% get plot handle
h = plot(xd,yd,'o-');

%specify data sources so that plot will update automatically
h.XDataSource = 'xd';
h.YDataSource = 'yd';
axis([0 11 -5 12]);

time = 0;

%Start alg. 13 from reader
for n = 1:nt
    %update loop variables
   rprev = r;
   r = rnext;
   
   %compute forces (Algorithm 13)
   fn = alg14_forcecalculation(r,dim,C);
   
   %compute acceleration
   a = fn/m;

   %compute next position
   rnext = 2*r-rprev+(dt^2)*a;
   
   %compute current velocity
   v = (rnext-rprev)/(2*dt);
   
    rnext(1,:) = [1 1];
    for i = 2:sqrtdim
         rnext((i-1)*sqrtdim+1,:) = [rnext((i-1)*sqrtdim+1,1) 1]; 
    end
   
   %replot results
   [xd,yd] = gplot(C,r);
   refreshdata;
   drawnow update
   
   time = time + dt;
   set(gcf,'NumberTitle', 'off')
   set(gcf,'Name', sprintf('%f',time))
end