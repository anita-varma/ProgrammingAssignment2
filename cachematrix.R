## Following functions would create a matrix that is inversible.It would create an inverse if there is no previously cached inverse available
## for future use.

## The makeCacheMatrix creates an inversible matrix

makeCacheMatrix <- function(x = matrix()) {
im<-NULL                          ## initialize inverse to null
setmat<-function(y)               ## function to cache matrix
{  
 x<<-y                            ## matrix y is set to y
im<<-NULL
}
getmat<-function() x               ## function to retrieve cached matrix
setinv<-function(m) {              ##function to cache inverse of matrix
im<<-m
}
getinv<-function() im              ## function to retrieve inverse of matrix
list(setmat=setmat,getmat=getmat,  ## list of set matrix,get matrix,set inverse and get inverse
setinv=setinv,getinv=getinv)

}


## cacheSolve function computes an inverse and caches it if a cached inverse is not available

cacheSolve <- function(x=matrix(), ...) {
data<-x$getmat()      ## Retrieve matrix
inv<-x$getinv()       ## Retrieve inverse


  if(!is.null(inv)) {   ##Check to see if the inverse is available
   msg<-  message("Returning cached data")
   msg           ## display message
   return(inv)   ## Return the cached inverse
  }



inv<-solve(data)   ## Compute the inverse of matrix
x$setinv(inv)      ## cache the inverse
print("New data")  ## Display message
return(inv)        ## Return the inverse
}




