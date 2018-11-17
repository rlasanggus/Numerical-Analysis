## <pre>Gauss Elimination</pre>  
#### <code>Gauss Elimination</code>  


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
#### <code>LU Factorization</code>  
