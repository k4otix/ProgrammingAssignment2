## These functions demonstrate the ability to use R's lexical scoping
## to create a matrix object that can store its inverse.  Calculating
## the inverse of a matrix can be a time-consuming operation, so this
## implementation allows a cached version to be retrieved instead.


## makeCacheMatrix: This function creates a special "matrix" object
## that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL  # the inverse of matrix x
    set <- function(y) {
        x <<- y
        inverse <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) inverse <<- inv
    getinverse <- function() inverse
    list(set = set, get = get, setinverse = setinverse, 
         getinverse = getinverse)
}


## cacheSolve: This function computes the inverse of the special "matrix"
## returned by makeCacheMatrix above. If the inverse has already been 
## calculated (and the matrix has not changed), then the cachesolve should
## retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    inverse <- x$getinverse()
    if (!is.null(inverse)) {
        message("getting cached data")
        return(inverse)     # return cached result
    }
    data <- x$get()         # get the matrix
    inverse <- solve(data)  # compute inverse
    x$setinverse(inverse)   # cache the result
    inverse                 # return the inverse
}
