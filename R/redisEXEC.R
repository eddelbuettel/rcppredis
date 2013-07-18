#'@title Execute all commands issued after MULTI
#'@export
redisEXEC <- function(Rc) {
	cmd <- sprintf("EXEC ")
	redisCommand(cmd, Rc)
}
