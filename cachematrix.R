## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix creates a matrix that is able to cache its inverse and
## return it accordingly, and store the matrix.


makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinv <- function(inverse) inv <<- inverse
        getinv <- function() inv
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## Write a short comment describing this function

## cacheSolve will compute the inversed matrix as returned by the
## makeCacheMatrix function above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
inv <- x$getinv()
if(!is.null(inv)) {
        message("getting cached result")
        return(inv)
}
data <- x$get()
inv <- solve(data, ...)
x$setinv(inv)
inv
}

## Checking if it works
m <- matrix(rnorm(11),2,2)
m1 <- makeCacheMatrix(m)
cacheSolve(m1)


