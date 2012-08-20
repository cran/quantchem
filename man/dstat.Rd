\name{dstat}
\alias{dstat}
\title{ Descriptive statistics of quantitative analysis results }
\description{
  Performs comprehensive statistical evaluation of quantitative analysis results.
}
\usage{
dstat(x, expected = median(unlist(x)), sort = TRUE, inverse.f = TRUE,
  na.rm = FALSE, conf.level = 0.95, alternative = c("two.sided", "less", "greater"), ansari = FALSE)
}
\arguments{
  \item{x}{ a vector of results, of a dataframe with results to compare }
  \item{expected}{ expected reference value }
  \item{sort}{ if TRUE, the matrices are sorted by means, variances or p-values. }
  \item{inverse.f}{ if F value in variance comparison is below 1, the inverse is taken
		(has no effect on p-value, but there are sometimes need to have such F }
  \item{na.rm}{ logical: should NA values be removed? }
  \item{conf.level}{ level for calculate confidence intervals }
  \item{alternative}{ alternative for all tests performed. }
  \item{ansari}{ due to reports of errors on some datasets, the ansari.test() on data is turned
                 off by default since 0.12. you can turn it on by setting this variable to TRUE }
}
\details{
   If argument is vector, several one-row matrices are produced (see below). If argument
   is a data.frame, there are also additional matrices with pairwise comparisons. The
   comparison of all groups by appropriate test are also calculated. This function
   prints its results with significance stars and returns a list invisibly.
}
\value{

 A list containing following matrices (if data is a vector, only 5 first are returned):

	\item{mean}{mean, its confidence interval and t-test for expected value}
	\item{median}{median, its confidence interval and Wilcoxon test for expected value}
	\item{var}{variance, standard deviation, standard error and Dixon test for outlier}
	\item{rsd}{relative standard deviation, its confidence interval and Grubbs test for outlier}
	\item{range}{minimum and maximum value, range, IQR, MAD and Shapiro-Wilk test for normality}
	\item{vartest}{ratios of variances, their confidence intervals and F test with p-value}
	\item{ttest}{differences between means, their confidence intervals and t test with p-value}
	\item{atest}{nonparametric differences in scale, their confidence intervals 
		and Ansari-Bradley test with p-value }
	\item{atest}{nonparametric differences in location, their confidence intervals 
		and Wilcoxon test with p-value }
	\item{anova}{ANOVA between all data}
	\item{kruskal}{Kruskal-Wallis test (nonparametric equivalent for ANOVA)}
	\item{bartlett}{Bartlett test for homogeneity of all variances}
	\item{fligner}{Fligner-Killeen test for equal variances (nonparametric alternative to Bartlett)}

}
\author{ Lukasz Komsta }
\seealso{ \code{\link{vstat}} }
\note{

	This function calculates always *both* parametric and nonparametric tests, and
	choosing a test to take into account should be also decision of analyst, based
	on the other tests results.

}

\examples{
set.seed(1234)
a = data.frame(x=rnorm(10),y=runif(10),z=rt(10,1))
dstat(a,0)
}
\keyword{htest}
