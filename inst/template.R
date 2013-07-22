#'@title %%summary%%
#'@export
redis%%funname%% <- function(%%args-argv%%Rc = NULL) {
	if (is.null(Rc)) Rc <- getOption("Rhiredis.connect")
	cmd <- "%%name%%"
	redisCommand(Rc, cmd%%args-value%%)
}
