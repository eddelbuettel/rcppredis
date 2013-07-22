#'@title Discard all commands issued after MULTI
#'@export
redisDISCARD <- function(Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "DISCARD"
	redisCommand(Rc, cmd)
}
