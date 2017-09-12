# Script: cachematrix.R
# Author: Steven Pettipas
# Date: 12 Sept 2017
#
# Two functions that demonstrate caching in R by using
# lexical scoping. One function constructs an object with
# setters, getters, and a matrix inverse field. The second
# function calculates the matrix inverse, using the object's
# cached field value when available.
#
# NOTE: These functions only work with square invertible
#       matrices.


# makeCacheMatrix
#
# A constructor function that takes a matrix and creates
# a matrix object with setters and getters for the matrix
# itself and the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {
        
        i <- NULL
        
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        
        get <- function() x
        
        setinverse <- function(inverse) i <<- inverse
        
        getinverse <- function() i
        
        list(set = set, get = get, setinverse = setinverse,
             getinverse = getinverse)
}


# cacheSolve
#
# A function that takes a matrix object (created by the
# makeCacheMatrix function) and solves for the inverse of
# that matrix. If the matrix object already has an inverse
# value in its field, calculation is skipped and the inverse
# value is returned.

cacheSolve <- function(x, ...) {
        
        i <- x$getinverse()
        
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        
        matrix <- x$get()
        i <- solve(matrix, ...)
        x$setinverse(i)
        
        i
}
