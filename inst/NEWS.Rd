\name{NEWS}
\title{News for Package \pkg{RcppRedis}}
\newcommand{\cpkg}{\href{http://CRAN.R-project.org/package=#1}{\pkg{#1}}}

\section{Changes in version 0.1.4 (2015-07-04)}{
  \itemize{
    \item Minor update to unit test setup for \cpkg{rredis}.
    \item No longer list URLs to Redis as automated CRAN tests for URL
    validity choke on redirects.
  }
}

\section{Changes in version 0.1.3 (2014-12-10)}{
  \itemize{
    \item Bug fix setting correct return type of \code{zcount}
  }
}

\section{Changes in version 0.1.2 (2014-11-06)}{
  \itemize{
    \item New commands \code{execv}, \code{hset}, \code{hget},
    \code{sadd}, \code{srem}, and \code{smembers} contributed by John
    Laing and Whit Armstrong over several pull requests.
  } 
}

\section{Changes in version 0.1.1 (2014-06-09)}{
  \itemize{
    \item Now with Windows support thanks to the installation of builds
    of the hiredis library (created by John Buonagurio) at CRAN /
    win-builder (thanks to Uwe Ligges)
    \item Added support for new command \code{zcount}
  } 
}

\section{Changes in version 0.1.0 (2014-05-10)}{
  \itemize{
    \item Initial CRAN upload
  } 
}
