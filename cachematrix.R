## Put comments here that give an overall description of what your
## functions do

## Create matrix to stored cached Inverse value

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  get <- function() x
  get_inverse <- function() i
  set_inverse <- function(inverse) i <<- inverse
  list(get_inverse = get_inverse, set_inverse = set_inverse, get = get)
}


## get inverse by either xaccessing its stored value
## or by calculating then storing it for future access

cacheSolve <- function(x, ...) {
  i <- x$get_inverse()
  if(!is.null(i)) {
    return(i)
  }
  
  matr <- x$get()
  i <- solve(matr)
  x$set_inverse(i)
  i
}