\name{vstat}
\alias{vstat}
\title{ Variability statistics of quantitative analysis results }
\description{
  Estimate error propagation of results (inter- and intra-day, inter- and intra-batch etc.)
}
\usage{
vstat(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ a data frame of results. Each column contain one serie of results}
  \item{...}{ optionally, more data frames, if additional factor is taking into account }
}
\details{

  This function performs one-way or two-way ANOVA on given results and prints summary in
  the usable way. If we are checking variability only between and within one kind of series (days,
  batches), we construct a data frame with a result sets in its columns and call this function
  on such data.frame. In this case, we get variability analysis of between-series and
  within-series. If we want to check variability additionally for example between weeks, we
  group results in data frames for each week and call the function on all data frames. This
  will summarize error propagation concerning series and groups.
}
\value{

The ANOVA object is returned, containing additional columns:

\item{Percent}{ Percentage indication of error propagation (total sum of squares is 100 percent}
\item{SD}{ Standard deviation (square root of Mean Sq) }
\item{RSD}{ Relative standard deviation (coefficient of variation) }

There are also additional rows - lowest row gives overall (total) error, and if function is called
on multiple data-frames, a row containing variability between all series (sum of within-groups and between-groups)
is given.

}
\author{ Lukasz Komsta }
\seealso{ \code{\link{dstat}} }
\examples{
set.seed(1234)
week1 = data.frame(mon=rnorm(6),tue=rnorm(6),wed=rnorm(6),thu=rnorm(6),fri=rnorm(6))
week2 = data.frame(mon=rnorm(6),tue=rnorm(6),wed=rnorm(6),thu=rnorm(6),fri=rnorm(6))
week3 = data.frame(mon=rnorm(6),tue=rnorm(6),wed=rnorm(6),thu=rnorm(6),fri=rnorm(6))
week4 = data.frame(mon=rnorm(6),tue=rnorm(6),wed=rnorm(6),thu=rnorm(6),fri=rnorm(6))
week1=week1+15;week2=week2+15;week3=week3+15;week4=week4+15
vstat(week1)
vstat(week1,week2,week3,week4)
}
\keyword{models}
