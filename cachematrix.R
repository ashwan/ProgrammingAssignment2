## An example of using the following two functions in the R console
##
## > source("cachematrix.R")
## > xvar <- makeCacheMatrix(matrix(c(10,20,30,40),ncol=2))
## > cacheSolve(xvar)
##
## The first line loads this file. The second line sets up a 2x2 matrix,
## with elements 10,20,30 and 40 and stores it in xvar. The third line
## calls cacheSolve to calculate the inverse and cache it.


## makeCacheMatrix is a function that defines a list of functions
## to cache a matrix and its inverse
makeCacheMatrix <- function(x = matrix()) {
	## First we initialize the variable inv to store the inverse
		inv <- NULL

	## The function set is what we call when we want to assign a new matrix
		set <- function(y) {
			x <<- y
			inv <<- NULL
		}

	## The function get returns the matrix currently assigned
		get <- function() x

	## setInverse caches the inverse
		setInverse <- function(inverse) inv <<- inverse

	## getInverse returns a cached inverse
		getInverse <- function() inv

	## The function makeCacheMatrix returns a list of the functions
	## we just defined. 
		list(set = set, get = get,
			setInverse = setInverse,
			getInverse = getInverse)
}

## cacheSolve is function to calculate and return
## the inverse of a matrix. It will also cache the
## inverse using the functions defined with makeCacheMatrix.
cacheSolve <- function(x) {
	## Get the inverse from cache
		inv <- x$getInverse()
	## If it's not null, return the cached value
		if (!is.null(inv)) {
			message("Getting cached data")
			return(inv)
		}
	## Else we get the new data,
		data <- x$get()
	## Calculate the inverse,
		inv <- solve(data)
	## Store it in the cache,
		x$setInverse(inv)
	## And finally return the solution
		inv
}
