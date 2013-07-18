#'@title %%summary%%
#'@export
redis%%funname%% <- function(%%args-argv%%Rc) {
	cmd <- sprintf("%%name%% %%args-cmd%%"%%args-value%%)
	redisCommand(cmd, Rc)
}
