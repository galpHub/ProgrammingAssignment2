## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix is a function that creates other functions for
## storing a matrix and computing its inverse (if not done previously).

## cacheSolve is a function that will use the output of makeCacheMatrix
## function in order to extract the precomputed value of the inverse 
## matrix (if stored) and computing it otherwise.

## Write a short comment describing this function

## Outputs the list of set/get function pairs for setting/getting a 
## matrix-inverseMatrix pair

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setInverse <- function(Inverse) m <<- Inverse
        getInverse <- function() m
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## Write a short comment describing this function

## This function uses the set/get functions outputted by the 
## makeCacheMatrix function in order to extract the inverse matrix
## that was previously stored in the enviroment of definition of
## makeCacheMatrix and compute it on the fly otherwise.

cacheSolve <- function(x) {
         m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setInverse(m)
        m
}
