#'@title Discard all commands issued after MULTI
#'@export
redisDISCARD <- function(Rc) {
	cmd <- "DISCARD"
	redisCommand(Rc, cmd)
}
