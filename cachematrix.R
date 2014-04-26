## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(mx = matrix()) {
  #initialize the inverse
  i <- NULL
  
  #Set function overvrites x and  defaults i
  set <- function(my) {
    mx <<- my    # both in the scope of makeChachematrix
    i <<- NULL
  }
  
  #Get function returns x
  get <- function(){
    mx
  }

  #setinv writes the i matrix with  the handled matrix
  
  setinv <- function(passed_inv){
    i <<- passed_inv  # In the scope of the makeChachematrix 
  }
  
  #getinv returns the  inverse
  getinv<- function(){
    i
  }
  
  #returniung the list of get/set parameters
  list(set = set, get = get,setinv = setinv,getinv = getinv)
}


## Write a short comment describing this function
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

#Trying to get the chached inverse in x
  inv <- x$getinv()
    if(!is.null(inv)) {
     #the  inversematrix chache in X is not empty, lets use it!
    message("using the cached inversematrix")
    return(inv)
  
  } else
  {
  # the chache is empty we have to  do the calculation
    # getting the original matrix
     mat <- x$get()
    # calculating the inverse
     inv <-  solve(mat)
    #giving it back to the chache of X
     x$setinv(inv)
    #printing the calculated matrix
    inv 
  }
}

