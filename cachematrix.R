## The below functions calculate and cache the inverse of the provided matrix

## makeCacheMatrix function caches the inverse of the matrix 'x' and fetches 
## the matrix 'x' or inverse of 'x'

makeCacheMatrix <- function(x = matrix()) {
	xInv <- matrix()
	cacheInv <- function(inv) {
		xInv <<- inv
		print("Caching the inverse of the matrix...")
	}
	getX <- function()	x
	getInv <- function()	xInv
	list(getX=getX,getInv=getInv,cacheInv=cacheInv)
}


## cacheSolve function checks if the inverse is cached earlier, if so,
## fetches the inverse, otherwise calculates and caches it

cacheSolve <- function(x, ...) {
		inv <- x$getInv()
		if(all(!is.na(inv))) {
			print("Fetching Cached Inverse...")
			return(inv)
		}
		x$cacheInv(solve(x$getX()))
		x$getInv()
}
