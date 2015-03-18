## makeCacheMatrix is a function that defines a list of functions
## to calculate and cache the inverse of a matrix passed to it
makeCacheMatrix <- function(x = matrix()) {
	## We first define the variable to store the inverse
	## and the functions that handle it

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

## cacheSolve is function to return the inverse of a matrix
## and to cache the inverse for use until a new matrix is passed.
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
