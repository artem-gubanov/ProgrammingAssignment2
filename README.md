### Introduction

In this second programming assignment an R function was implemented
that is able to cache potentially time-consuming computations.
Specifically, matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than compute it repeatedly.
Code was wrote/modified by Artem as a second programming assignment
for R-programmin Coursera course on August 2016.



### Example: Caching the Inverse Matrix of a Matrix

Assumptions: matrix supplied is always square and invertible.
Here is some code providing an example of the abover function.
Please, meake sure you set working directory correctly before using it.

Load the code:
> source("cachematrix.R")

Create emply makeCacheMatrix object:

> mymat <- makeCacheMatrix()

One can check that it has empty matrix and inverse matrix is not defined (NULL):
> mymat$get()
> mymat$getinv()

Set simple matrix 3 by 3 to makeCacheMatrix object:
> mymat$set(matrix(c(1, 21, 31, 12, 22, 32, 13, 23, 33), nrow=3, ncol=3))

One can check that it has that matrix but inverse matrix is not defined (NULL) yet:
> mymat$get()
> mymat$getinv()

To get inverse matrix, the function cacheSolve should be used:
> cacheSolve(mymat)

After cacheSolve was called, the inverse matrix in the object should be defined as well:
> mymat$getinv()

If now cacheSolve is called (without changing matrix object), then cached data on
inverse matrix will be returned (and message about this will be printed):
> cacheSolve(mymat)

If another matrix is set to object, then inverse matrix is not defined (NULL):
> mymat$set(matrix(c(11, 21, 31, 12, 22, 32, 13, 23, 33), nrow=3, ncol=3))
> mymat$getinv()

So, cacheSolve should be used to get inverse matrix. However, the new matrix is not invertible!!
As a result, an error using solve function is printed.
> cacheSolve(mymat)
