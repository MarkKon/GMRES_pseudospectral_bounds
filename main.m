
% Example D:
% N = 64;
% s = 1;
% l = 5;
% A = eye(N) + 0.7*diag(ones(N-1,1),1);
% opts.npts = 48;
% opts.no_graphics = 1;
% opts.levels = [-10:-1];
% opts.ax = [];
% [rhovec,Cvec,k] =testGMRES(A,N,opts,s,l);
% eigtool(A,opts,1);

% opts.no_graphics = 1;

% opts.ax=[];
% [rhovec,Cvec,k] =testGMRES(A,N,opts,s,l);

%Example A:
% N = 100;
% s = 1;
% l = 5;
% A = diag(linspace(.2,.21,N));
% opts.ax = [.19,.22, -.015,.015];
% opts.npts = 100;

%Example B:
% B = diag(linspace(.2,.21,N/2));
% opts.ax = [.18,.23, -.015,.015];
% C = [1 100;0 1];
% A = kron(C,B);
% s = 1e-4;
% l= 3;


%Example F:
% N = 64;
% s = 1;
% l = 5;
% beta = 5/2;
% d = [1:N-1];
% A = eye(N) + diag(beta*(d.^(-1)),1);
% opts.npts = 48;
% opts.no_graphics = 1;
% opts.levels = [-10:-1];
% [rhovec,Cvec,k] =testGMRES(A,N,opts,s,l);
% eigtool(A,opts,1)

%Diffusion
N = 144;
s = 1;
l = 4;
A = full(supg_demo(12));
opts.ax = [-0.025 0.175 -0.1 0.1];
opts.npts = 48;
opts.no_graphics = 1;
opts.levels = [-8:-2];
[rhovec,Cvec,k] =testGMRES(A,N,opts,s,l);


% N = 128;
% A = sparserandom_demo(N);
% opts.no_graphics = 0;
% opts.levels = [-10:-1];
% opts.npts = 24;
%  eigtool(A,opts,1);
% opts.ax=[];
% opts.no_graphics = 1;
% [rhovec,Cvec,k] =testGMRES(A,N,opts,s,l);