redisConnect <-
function(host='localhost', port=6379, password=NULL,
         returnRef=FALSE, nodelay=TRUE, timeout=86400L, closeExisting=TRUE)
{
  if(closeExisting) tryCatch(redisClose(), error=invisible)
  .redisEnv$current <- new.env()
  assign('pipeline',FALSE,envir=.redisEnv$current)
  con <- .openConnection(host=host, port=port, nodelay=nodelay, timeout=timeout, envir=.redisEnv$current)
  if (!is.null(password)) tryCatch(redisAuth(password),
    error=function(e) {
      cat(paste('Error: ',e,'\n'))
            .closeConnection(con);
            rm(list='con',envir=.redisEnv$current)
          })
  tryCatch(.redisPP(),
    error=function(e) {
      cat(paste('Error: ',e,'\n'))
            .closeConnection(con);
            rm(list='con',envir=.redisEnv$current)
          })
  if(returnRef) return(.redisEnv$current)
  invisible()
}

redisClose <-
function(e)
{
  if(missing(e)) e = .redisEnv$current
  con <- .redis(e)
  .closeConnection(con)
  remove(list='con',envir=e)
}

redisAuth <-
function(pwd)
{
  .redisCmd(.raw('AUTH'), .raw(pwd))
}

# Redis ordered set functions
redisZAdd <- function(key, score, member) {
  .redisCmd(.raw('ZADD'), .raw(key), .raw(as.character(score)), .raw(member))
}
