function [root,eam]=newtraph(func,dfunc,xr,es,maxit,varargin)
if nargin<3,error('at least 3 input arguments required'),end
if nargin<4|isempty(es),es=0.0001;end
if nargin<5|isempty(maxit),maxit=50;end
iter = 0; root = []; eam = [];
while (1)
xrold = xr;
xr = xr - func(xr)/dfunc(xr);
iter = iter + 1;
root(iter,1) = xr;
if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
eam(iter,1) = ea;
if ea <= es | iter >= maxit, break, end
end

