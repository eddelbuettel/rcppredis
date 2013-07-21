#'@title Find all keys matching the given pattern
#'@export
redisKEYS <- function( pattern, Rc) {
	cmd <- "KEYS"
	redisCommand(Rc, cmd, list(pattern))
}
