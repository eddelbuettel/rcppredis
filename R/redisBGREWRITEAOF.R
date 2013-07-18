#'@title Asynchronously rewrite the append-only file
#'@export
redisBGREWRITEAOF <- function(Rc) {
	cmd <- sprintf("BGREWRITEAOF ")
	redisCommand(cmd, Rc)
}
