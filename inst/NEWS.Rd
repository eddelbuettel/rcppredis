\name{NEWS}
\title{News for Package \pkg{RcppRedis}}
\newcommand{\ghpr}{\href{https://github.com/eddelbuettel/rcppredis/pull/#1}{##1}}
\newcommand{\ghit}{\href{https://github.com/eddelbuettel/rcppredis/issues/#1}{##1}}

\section{Changes in version 0.2.0 (2022-03-08)}{
  \itemize{
    \item Two simple C++11 features remove needs for \pkg{BH} and
    \code{lexical_cast()} (Dirk in \ghpr{45} addressing \ghit{44}).
    \item Redis pub/sub is now supported (Dirk in \ghpr{43}, Bryan in \ghpr{46}).
    \item Bryan Lewis is now a coauthor.
    \item Added pub/sub examples for single and multiple Globex symbols.
    \item The included hiredis sources have been updated to release 1.0.2.
    \item Two vignettes have been added to introduce Redis and to described a live
    market-monitoring application included in directory \code{pubsub/}.
    \item The UCRT build was updated per a suggestion by Tomas.
  }
}

\section{Changes in version 0.1.11 (2021-06-26)}{
  \itemize{
    \item The CI setup was updated to use \code{run.sh} from
    \href{https://eddelbuettel.github.io/r-ci/}{r-ci} (Dirk).
    \item A new function \code{quit} can be used to close a connection
    (Dirk).
    \item The windows build was updated to libhiredis 1.0.0, and UCRT
    support was added (Jeroen in \ghpr{42}).
  }
}

\section{Changes in version 0.1.10 (2020-01-16)}{
  \itemize{
    \item The package now uses \pkg{tinytest} for unit tests (Dirk in
    \ghpr{41}).
  }
}

\section{Changes in version 0.1.9 (2018-10-27)}{
  \itemize{
    \item The \code{configure} setup is more robust with respect to the
    C++ setup [CRAN request].
    \item The Travis builds was updated to R 3.5 along with all others
    (\ghpr{34}).
    \item A new Redis function \code{hexists} was added (Whit Armstrong
    in \ghpr{35}).
    \item The \pkg{hiredis} library source is now included, and built on
    all systems unwilling or unable to provide it (\ghpr{36}).
    \item Added hash functions HDEL, HLEN, HKEYS, and HGETALL (Whit
    Armstrong in \ghpr{38}).
  }
}

\section{Changes in version 0.1.8 (2017-09-09)}{
  \itemize{
    \item A new file \code{init.c} was added with calls to
    \code{R_registerRoutines()} and \code{R_useDynamicSymbols()}
    \item Symbol registration is enabled in \code{useDynLib}
    \item Travis CI was updated to using \code{run.sh}
    \item The (optional MessagePack) code was updated for MsgPack 2.*
  }
}

\section{Changes in version 0.1.7 (2016-04-27)}{
  \itemize{
    \item Added support for \code{timeout} constructor argument (PR \ghpr{14} by
    Russell Pierce)
    \item Added new commands \code{exists}, \code{ltrim}, \code{expire} and
    \code{pexpire} along with unit tests (PR \ghpr{16} by Russell
    Pierce)
    \item Return \code{NULL} for empty keys in serialized \code{get} for
    consistency with \code{lpop} and \code{rpop} (also PR \ghpr{16} by Russell
    Pierce)
    \item Minor corrections to \code{get} code and \code{hget} and
    \code{hset} documentation (also PR \ghpr{16} by Russell Pierce)
    \item Error conditions are now properly forwarded as R errors (PR
    \ghpr{22} by Russell Pierce)
    \item Results from Redis commands are now checked for \code{NULL} (PR
    \ghpr{23} by Russell Pierce)
    \item MessagePack encoding can now be used which requires
    MessagePackage headers of version 1.0 or later; the (optional)
    RcppMsgPack package can be used.
  }
}

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
