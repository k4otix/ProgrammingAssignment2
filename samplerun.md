## Sample run of cachematrix.R
The following R terminal output shows two calls to cacheSolve().  In
the first call, the inverse of m_cache must be calculated.  In the
second call, the cached value is retrieved.

```
> source("ProgrammingAssignment2/cachematrix.R")
> m = matrix(c(4,3,3,2), 2, 2)
> m
     [,1] [,2]
[1,]    4    3
[2,]    3    2
> m_cache <- makeCacheMatrix(m)
> cacheSolve(m_cache)
     [,1] [,2]
[1,]   -2    3
[2,]    3   -4
> cacheSolve(m_cache)
getting cached data
     [,1] [,2]
[1,]   -2    3
[2,]    3   -4
```
