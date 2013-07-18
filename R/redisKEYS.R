#'@title Find all keys matching the given pattern
#'@export
redisKEYS <- function( pattern, Rc) {
	cmd <- sprintf("KEYS %s", pattern)
	redisCommand(cmd, Rc)
}
