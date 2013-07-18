#'@title Discard all commands issued after MULTI
#'@export
redisDISCARD <- function(Rc) {
	cmd <- sprintf("DISCARD ")
	redisCommand(cmd, Rc)
}
