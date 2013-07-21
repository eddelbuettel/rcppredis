#'@title Execute all commands issued after MULTI
#'@export
redisEXEC <- function(Rc) {
	cmd <- "EXEC"
	redisCommand(Rc, cmd)
}
