## <pre>Bracketing Methods</pre>  
* Bracketing methodsare based on making two initial guesses that “bracket” the root.  
* Brackets are formed by finding two guesses xland xuwhere the sign of the function changes; that is, where f(xl) f(xu) < 0  
#### <code>Incremental Search</code>  
* The incremental searchmethod tests the value of the function at evenly spaced intervals and finds brackets by identifying function sign   changes between neighboring points.  
```matlab
x = linspace(xmin, xmax, ns);
f = func(x);
nb = 0; xb = []; %xb is null unless sign change detected
for k=1:length(x)-1
    if sign(f(k)) ~= sign(f(k+1)) % check for sign change
        nb = nb +1;
        xb(nb,1) = x(k);
        xb(nb,2) = x(k+1);
    end
end
```  
입력받은 값으로 구간을 나누고  
그 구간에서의 부호 변화를 체크  

#### <code>Bisection Method</code>  
* Step 1: Choose xl and xusuch that xl and xu  
bracket the root, i.e. f(xl)*f(xu) < 0.  
* Step 2 : Estimate the root (bisection).  
xr= 0.5*(xl + xu)  
* Step 3: Determine the new bracket.  
If f(xr)*f(xl) < 0 thenxu= xr  
else xl = xrend  
* Step 4: Examine if xris the root.
```matlab
 xrold = xr;
    xr = (xl + xu)/2;
    iter = iter + 1;
    if xr ~= 0,ea = abs((xr -xrold)/xr) * 100;end
    test = func(xl,varargin{:})*func(xr,varargin{:});
    if test < 0
    xu = xr;
    elseif test > 0
    xl = xr;
    else
```  
xr = (xl
#### <code>False Position Method</code>  
## <pre>Open Methods</pre>  
#### <code>Newton-Raphson Method</code>  
#### <code>Secant Method</code>  
