URL <- sprintf("http://redis.io/commands/#")
library(XML)
library(stringr)
# src <- readLines(URL)
src <- htmlParse(URL)

result <- list()
li.nodes <- xpathSApply(src, "//li")
for(node in li.nodes) {
	doc <- xmlDoc(node)
	name <- xpathSApply(doc, "//a", xmlValue)
	stopifnot(! name %in% names(result))
	span.args <- str_trim(strsplit(xpathSApply(doc, "//span[@class='args']", xmlValue), "\n", fixed=TRUE)[[1]])
	span.args <- span.args[nchar(span.args) > 0]
	span.args <- paste(span.args, collapse=" ")
	span.args <- substr(span.args, 1, attr(gregexpr("^(?<args>[a-z\\s]+)", span.args, perl=TRUE)[[1]], "capture.length")[1])
	args <- strsplit(span.args, " ")[[1]]
	span.summary <- xpathSApply(doc, "//span[@class='summary']", xmlValue)
	result[[name]] <- list(
		name = name, 
		args = args,
		summary = span.summary
	)
}

template <- paste(readLines("template.cpp"), collapse="\n")

keys <- c("summary", "name", "args-argv", "args-cmd", "args-value")
values <- list(
	summary = function(cmd) {
		cmd$summary
	}, 
	name = function(cmd) {
		cmd$name
	},
	"args-argv" = function(cmd) {
		paste("CharacterVector", cmd$args, collapse=", ")
	},
	"args-cmd" = function(cmd) {
		paste(rep("%s", length(cmd$args)), collapse=" ")
	}, 
	"args-value" = function(cmd) {
		paste(paste("CHAR(wrap(", cmd$args, "[0]))", sep=""), collapse=", ")
	}
)

for(cmd in result) {
	output <- template
	for(key in keys) {
		pattern <- paste("%%", key, "%%", sep="")
		output <- gsub(pattern=pattern, replacement=values[[key]](cmd), x=output, fixed=TRUE)
	}
	write(output, sprintf("test/redis%s.cpp", cmd$name))
}



