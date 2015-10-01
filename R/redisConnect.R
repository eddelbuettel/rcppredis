#' redisConnect
#'
#' @param host The Redis server host name or inet address (optional, character). The default value is "localhost".
#' @param port The Redis port number (optional, numeric or integer). The default value is 6379L.
#' @param password Redis authentication password (if applicable)
#'
#' @return The redis connection object
#' @export
#'
#' @examples
#' #' # Not Run
#' # redisLocalhost <- redisConnect()
#' # redisRemotehostWithAuth <- redisConnect("192.168.1.200",password="myPassword")
redisConnect <- function(host = "localhost", port = 6379, password = NULL) {
  redisConn <- capture.output(new(Redis, host, port, password))
  return(redisConn)
}