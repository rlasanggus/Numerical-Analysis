## <pre>Gauss Elimination</pre>  
#### <code>Gauss Elimination</code>  
![image](https://user-images.githubusercontent.com/43701183/48657269-4afbfe00-ea72-11e8-8c3f-c1fd365f6c4c.png)  
```matlab
%forward elimination
for k = 1: n-1
    for i = k+1 : n
        factor = Aug(i,k)/Aug(k,k);
        Aug(i,k:nb) = Aug(i,k:nb)-factor*Aug(k,k:nb);
    end
end

% back substitution
x = zeros(n,1);
x(n) = Aug(n,nb)/Aug(n,n);
for i = n-1:-1:1
    x(i) = (Aug(i,nb)-Aug(i,i+1:n)*x(i+1:n))/Aug(i,i);
end
```  


#### <code>Partial Pivoting</code>  
* Problems with naïve Gauss elimination  
  * division by 0  
  * division by a number close to 0: round-off error  
  
* Pivoting  
  * Find the row with the largest absolute coefficient in the column below the pivot element  
  * Switch the rows so that the largest element is the pivot element (partial pivoting)  
  * complete pivoting.  

```matlab
% partial pivoting
[big,i]=max(abs(Aug(k:n,k)));
ipr=i+k-1;
if ipr~=k
Aug([k,ipr],:)=Aug([ipr,k],:);
end
for i = k+1:n
factor=Aug(i,k)/Aug(k,k);
Aug(i,k:nb)=Aug(i,k:nb)-factor*Aug(k,k:nb);
end
```  
## <pre>LU Factorization</pre>  
* LU factorization  
* Gauss elimination as an LU factorization  
![image](https://user-images.githubusercontent.com/43701183/48657338-d07fae00-ea72-11e8-90a9-a2fa5613dd82.png)  

#### <code>LU Factorization</code>  

