## <pre>Optimization</pre>
#### <code>Golden-Section Search</code>  
> First pick two points [xl xu] that will bracket the extremum.  
> Pick additional third and fourth points within this interval to determine whether the extremum has occurred within the first three or last three points  
> The key to making this approach efficient is the wise choice of itermediate points and thus minimizing function evaluations by replacing old values with new values.  


* If f(x1)<f(x2), x2 becomes the new lower limit and x1 becomes the new x2 (as in figure).  
* If f(x2)<f(x1), x1 becomes the new upper limit and x2 becomes the new x1.  
* In either case, only one new interior point is needed and the function is only evaluated one more time.  
![image](https://user-images.githubusercontent.com/43701183/48657211-7500f080-ea71-11e8-9050-032ceefa6f0d.png)  
```matlab
d = (phi-1)*(xu - xl);
x1 = xl + d;
x2 = xu - d;
if f(x1,varargin{:}) < f(x2,varargin{:})
xopt = x1;
xl = x2;
else
xopt = x2;
xu = x1;
end
iter=iter+1;
if xopt~=0, ea = (phi - 1) * abs((xu - xl) / xopt) * 100;end
if ea <= es | iter >= maxit,break,end
```

