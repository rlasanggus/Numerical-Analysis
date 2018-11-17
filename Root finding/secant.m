function [root,eam] = secant(func,xl,xu,es,maxit,varargin)
if nargin<3,error('at least 3 input arguments required'),end
if nargin<4|isempty(es),es=0.0001;end
if nargin<5|isempty(maxit),maxit=50;end
iter = 0;
xrr = xu; xrold = xl; root = []; eam = [];
while(1)
    xr = xrold;
    xrold = xrr;
    xrr = xrold - func(xrold)*(xrold - xr)/(func(xrold)-func(xr));
    iter = iter +1;
    root(iter,1) = xrr;
    if xrr ~= 0, ea = abs((xrr - xrold)/xrr) * 100; end
    eam(iter,1) = ea;
    if ea <= es | iter >= maxit, break, end
end