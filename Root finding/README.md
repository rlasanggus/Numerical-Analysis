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
#### <code>False Position Method</code>  
* Step 1: Choose xl and xusuch that xl and xu  
bracket the root, i.e. f(xl)*f(xu) < 0.  
* Step 2: Estimate the root.  
xr= xu-f(xu)(xu-xl)/(f(xu) -f(xl))  
* Step 3: Determine the new bracket.  
If f(xr)*f(xl) < 0 thenxu= xr  
else xl = xrend  
* Step 4: Examine if xris the root.  
* Step 5: If not, repeat steps 2 and 3 untila stopping criterion is met.  
```matlab
xrold = xr;
    fl=func(xl,varargin{:});
    fu=func(xu,varargin{:});
    xr = xu -fu*(xl -xu)/(fl -fu);
    iter = iter + 1;
    if xr ~= 0,ea = abs((xr -xrold)/xr) * 100;end
    test = fl*func(xr,varargin{:});
    if test < 0
    xu = xr;
    elseif test > 0
    xl = xr;
 ```  
## <pre>Open Methods</pre>  
* Open methods require only a single starting value or two starting values that do not necessarily bracket a root.  
* Open methods may diverge as the computation progresses, but when they do converge, they usually do so much faster than bracketing methods.  
#### <code>Newton-Raphson Method</code>  
* Step 1: Start at the point (x1, f(x1)).  
* Step 2: The intersection of the tangent of f(x) at this point and the x-axis. x2 = x1 - f(x1)/f ‘(x1)
* Step 3: Examine if f(x2) = 0 or abs(x2 - x1) < tolerance.  
* Step 4: If yes, solution xr = x2 If not, set x1 to x2, repeat the iteration.  
```matlab
xrold = xr;
xr = xr - func(xr)/dfunc(xr);
iter = iter + 1;
root(iter,1) = xr;
if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
eam(iter,1) = ea;
if ea <= es | iter >= maxit, break, end
```  

#### <code>Secant Method</code>  
* A potential problem in implementing the Newton-Raphson method is the evaluation of the derivative - there are certain functions whose derivatives may be difficult or inconvenient to evaluate.  
* For these cases, the derivative can be approximated by a backward finite divided difference:  
![image](https://user-images.githubusercontent.com/43701183/48657088-6b2abd80-ea70-11e8-8f01-eb078d22ec4a.png)  
```matlab
    xr = xrold;
    xrold = xrr;
    xrr = xrold - func(xrold)*(xrold - xr)/(func(xrold)-func(xr));
    iter = iter +1;
    root(iter,1) = xrr;
    if xrr ~= 0, ea = abs((xrr - xrold)/xrr) * 100; end
    eam(iter,1) = ea;
    if ea <= es | iter >= maxit, break, end
 ```
