#'@title Add multiple sets and store the resulting set in a key
#'@export
redisSUNIONSTORE <- function( destination,  key, Rc) {
	cmd <- sprintf("SUNIONSTORE %s %s", destination, key)
	redisCommand(cmd, Rc)
}
