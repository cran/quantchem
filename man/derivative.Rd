\name{derivative}
\alias{derivative}
\title{ Derivative of fitted polynomial }
\description{
  Calculate derivative of polynomial for given x.
}
\usage{
derivative(obj, x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{obj}{ an object of class 'lm', fitted in \code{y ~ x + I(x^2) + I(x^3) + ...} way.}
  \item{x}{ a vector of x values }
}
\details{

 This function is called via the other high level functions, but it can
 be also called directly. 

}
\value{

A vector of calculated derivatives.

}
\author{ Lukasz Komsta }
\seealso{ \code{\link{lm}} }
\examples{
x = 1:10
y = jitter(x+x^2)
fit = lm(y~x+I(x^2))
derivative(fit,1:10)
}
\keyword{models}
