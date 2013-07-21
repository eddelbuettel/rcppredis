#'@title Asynchronously rewrite the append-only file
#'@export
redisBGREWRITEAOF <- function(Rc) {
	cmd <- "BGREWRITEAOF"
	redisCommand(Rc, cmd)
}
