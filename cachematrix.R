# --------------------------
## cachematrix.R -----------
## Two functions that cache then inverse a matrix.
# --------------------------
# --------------------------
# makeCacheMatrix
# Description --------------
# Creates a matrix cache object that can be inversed.

# Usage--------------------
# makeCacheMatrix(cacheMatrix)

# Arguments----------------
# cacheMatrix  a matrix to be cached
# -------------------------

makeCacheMatrix <- function(cacheMatrix = matrix()) {        
    # object to store the inverse matrix, initializes to NULL
    invMatrix <- NULL
    # initialize cache matrix outside current environment
    setMatrix <- function(ext) {      
        cacheMatrix <<- ext
        invMatrix <<- NULL
    }
    # return the value of the cached matrix previously set
    getMatrix <- function() {
        cacheMatrix
    }
    # store the inverse of the matrix
    setinverseMatrix <- function(inverseMatrix){
        invMatrix <<- inverseMatrix
    }                             
    # return the value of the cached inverse
    getinverseMatrix <- function(){
        invMatrix
    }
    list(setMatrix = setMatrix, getMatrix = getMatrix, 
        setinverseMatrix = setinverseMatrix, getinverseMatrix = getinverseMatrix)
}

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
