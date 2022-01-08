
## Pub/Sub Example with 'Life' Intra-Daily Market Data

### What Is This?

This directory contains a pair of files to gather and display "live" (_i.e._
delayed by the usual amount as is common for non-subscribers to generally
expensive live market data) futures data.

One file uses package [quantmod](https://cloud.r-project.org/package=quantmod)
to gather the data. It collects the data points in [Redis](https://redis.io) to
build a history, but also publishes the on a channel by the name of the symbol.

The second file retrieves the recent history, and subscribes to the channel to
receive updates which it displays as it gets them.  Because it uses an R
graphics device to plot (also via package
[quantmod](https://cloud.r-project.org/package=quantmod)) it is easiest to
`source()` the file in an R session as using `Rscript` or `r` (from
[littler](https://cloud.r-project.org/package=quantmod) leads to plotting to pdf
instead).

The third file should be invoked weekly or daily from `crontab` and prunes the
history down to just the last months.  All three files could be generalized to
read more than one symbol, or host, or ... from config files.  For now, and for
simplicity, just the front ES contract is monitored.

### Acknowledgements

These files owes their basic structure to a [gist by Josh Ulrich](## cf
https://gist.github.com/joshuaulrich/ee11ef67b1461df399b84efd3c8f9f67#file-intraday-sp500-r)
which also contained the basic subscription loop (and which is also the basis of
this [extended and documented version in package
dang](https://github.com/eddelbuettel/dang/blob/master/R/intradayMarketMonitor.R). This
was then generalized to use a symbol such as `ES=F` (for the front month SP500
futures contract) for which no history is available by both caching in [Redis](https://redis.io)
and using pub/sub to distribute.  The
[rredis](https://cloud.r-project.org/package=rredis) was used for the initial
pub/sub approach.  Bryan W. Lewis then ported and adapted the pub/sub model to
this RcppRedis package.

### Authors

Dirk Eddelbuettel, Joshua Ulrich, Bryan W. Lewis

### License

GPL (>= 2)
