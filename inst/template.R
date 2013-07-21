#'@title %%summary%%
#'@export
redis%%funname%% <- function(%%args-argv%%Rc) {
	cmd <- "%%name%%"
	redisCommand(Rc, cmd%%args-value%%)
}
