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


# -------------------------
# cacheSolve
# Description -------------
# Computes and returns the inverse of the cached "matrix" object.

# Usage--------------------
# cacheSolve(cachedMatrix, ...)

# Argument-----------------
# cachedMatrix    cached matrix object
# ...   other arguments passed to or from other functions
# -------------------------

cacheSolve <- function(cachedMatrix, ...) {
    # Retrieve inversed matrix cached object passed from the parent frame  
    inverseMatrix <- cachedMatrix$getinverseMatrix()     
    # If cached object already contains an inversed matrix
    if (!is.null(inverseMatrix)){
        message("retrieved cached data")
        # return cached inversed matrix
        return (inverseMatrix)      
    }                       
    # if the inverse matrix hasn't been cached,
    # grab the cached matrix
    else {
      tmpMatrix <- cachedMatrix$getMatrix()
      message("building inverse matrix")
      # Inverse the data matrix
      inverseMatrix <- solve(data, ...)
      # Cache inversed matrix
      cachedMatrix$setinverseMtrix(inverseMatrix)
      # Return the inversed matrix
      return (inverseMatrix)                       
    }
}
