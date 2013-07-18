#'@title Returns the bit value at offset in the string value stored at key
#'@export
redisGETBIT <- function( key,  offset, Rc) {
	cmd <- sprintf("GETBIT %s %s", key, offset)
	redisCommand(cmd, Rc)
}
