## This file contains pair of functions that cache the inverse of a matrix.
## Matrix inversion is usually a costly computation and there may be some benefit to caching
## the inverse of a matrix rather than compute it repeatedly.
## Assumptions: matrix supplied is always square and invertible.

## Wrote by Artem as a second programming assignment for R-programmin Coursera course on August 2016.

## makeCacheMatrix creates a special "matrix" object, which is a list
## containing functions to set and get values for matrix and its inversion.


makeCacheMatrix <- function(x = matrix()) {
    # initialize inverse matrix by NULL
    invmat <- NULL
    # define set fuction for matrix object
    set <- function(y) {
        # assign values to "x" using operator "<<-"
        # it looks for "x" in parent environment where this function is defined (not in environment where is evaluated)
        # as a result, it re-defines "x" inside this object
        x <<- y
        # consistently, re-initialize inverse matrix by NULL (othewise it might keep old one)
        # NOTE: "<<-" is used as well!
        invmat <<- NULL
    }
    # define get fuction for matrix object (no input arguments, returns matrix)
    get <- function() x
    # define set fuction for inverse matrix (so, it can be assigned explicitly from "working" environment)
    setinv <- function(inversionmatrix) invmat <<- inversionmatrix
    # define get fuction for matrix inversion (no input arguments, returns inverse matrix)
    getinv <- function() invmat
    # return list of "functions" to this special maxtrix object, so them can be "called" by their names from object
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## cacheSolve: gets cached or computes the inversion of the special "matrix" object returned by makeCacheMatrix function.
## It first checks if the inverse matrix has already been calculated.
## If so, it gets it from the cache and skips the computation.
## Otherwise, it calculates it and sets inverse matrix to maxtrix object using set function.

cacheSolve <- function(x, ...) {
    # get inverse matrix (can be already calculated or NULL if not yet) using "get" fuctiont-method of object "x"
    invmat <- x$getinv()
    # check if inverse matrix was already calculated or not
    if(!is.null(invmat)) {
        message("getting cached data on inverse matrix")
        return(invmat)
    }
    # if not, calculate inverse matrix
    matdat <- x$get() # get matrix
    # calculate inverse matrix (NOTE: matdat must be square invertible matrix!)
    invmat <- solve(matdat) # one input argument, so it returns inverse matrix with default precision
    # set new inverse matrix to matrix ojbect
    x$setinv(invmat)
    # return inverse matrix as function outcome
    invmat
}
