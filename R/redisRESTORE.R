#'@title Create a key using the provided serialized value, previously obtained using DUMP.
#'@export
redisRESTORE <- function( key,  ttl,  serialized, Rc) {
	cmd <- sprintf("RESTORE %s %s %s", key, ttl, serialized)
	redisCommand(cmd, Rc)
}
