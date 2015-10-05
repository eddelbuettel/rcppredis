\name{NEWS}
\title{News for Package \pkg{RcppRedis}}
\newcommand{\ghpr}{\href{https://github.com/eddelbuettel/rcppredis/pull/#1}{##1}}
\newcommand{\ghit}{\href{https://github.com/eddelbuettel/Rcppredis/issue/#1}{##1}}

\section{Changes in version 0.1.6 (2015-10-05)}{
  \itemize{
    \item Added support (including new unit tests) for \code{lpop},
    \code{rpop}, \code{lpush}, \code{rpush} as well as \code{auth} via
    augmented constructor (all thanks to PRs \ghpr{11} and \ghpr{13} by
    Russell Pierce)
    \item Added \code{ping} command and unit test
  }
}

\section{Changes in version 0.1.5 (2015-07-17)}{
  \itemize{
    \item Another minor fix to unit test setup for \CRANpkg{rredis}.
  }
}

\section{Changes in version 0.1.4 (2015-07-04)}{
  \itemize{
    \item Minor update to unit test setup for \CRANpkg{rredis}.
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
    Laing and Whit Armstrong over pull requests \ghpr{3} and \ghpr{4}.
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
