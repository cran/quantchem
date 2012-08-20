\name{lmcal, nlscal}
\alias{lmcal}
\alias{print.lmcal}
\alias{nlscal}
\alias{print.nlscal}
\title{ Perform linear and nonlinear calibration of analytical method }
\description{
  Fit given calibration data to several regression models.
}
\usage{
lmcal(x, y, confint = 0.95, gridratio = 0.05)
nlscal(x, y, confint = 0.95, gridratio = 0.05)
}
\arguments{
  \item{x}{ a vector of standard concentrations }
  \item{y}{ a vector of corresponding respondes (peak areas etc.) }
  \item{confint}{ confidence interval for graphing prediction intervals }
  \item{gridratio}{ a part of x variable range, to extend plot range (default 5 percent) }
}
\details{

 For linear 'lmcal' fitting, procedure is performed as follows. First, the 
 calibration data are fitted to OLS linear, quadratic, cubical, and
 4th order polynomial. These models are called p1 - p4. Next, linear model is
 reweighted using x and y raised to power gamma from range (-4,4) with 0.1 accuracy.
 The optimal weights are detected by minimal mean relative error (MRE) according
 to Almeida et al. (2002). The best weighting scheme is then chosen, and data
 are fit to the same equations (called P1-P4, with uppercase).

 Next, the optimal value of lambda for Box-Cox transform is estimated with accuracy
 up to 0.001, for transformation of x and y. The transformed models are then
 fitted (called bx and by). 

 Then, two next log-log transformed models, are fitted - linear called l1, and
 quadratic (mentioned sometimes as Wagner transform), called l2. 

 Last, the same models as p1 - p4 and P1 - P4, are fitted using \code{rlm} robust
 method, and called r1 - r4 and R1 - R4.

 This function performs also computation of grid and corresponding predicted values
 for easy graphing of fitted models.

 For nonlinear 'nlscal' fitting, procedure is performed as above, but there are following
 models fitted: asymptotic (a1), asymptotic through origin (a2), logistic (g1), four
 parameter logistic (g2), Michaelis-Menten (m1) and nonparametric (loess) spline (s1).
 There are no weighting nor transform when fitting by 'nlscal'.
 
}
\value{
 Returns object of class \code{c("lmcal","cal")} or \code{c("nlscal","cal")}, which is the list of following
 components:

 \item{models}{A list of fitted models (p1-p4,P1-P4,l1,l2,bx,by,r1-r4,R1-R4)}
 \item{graph}{A list used by \code{plot()} method to produce graphs. Stored permanently
 to make custom graphing easier. Containing following elements: grid - a grid of x values, 
 fitted - corresponding fitted values, upperc,lowerc - upper and lower bound for 
 \code{interval="confidence"} prediction, upperp,lowerp - upper and lower bound for 
 \code{interval="prediction"} prediction
}
 \item{x}{Concentration vector}
 \item{y}{Response vector}

 Linear calibration object contains also following elements:

 \item{weigh}{A dataframe containing sequence of gamma values and corresponding
   mean relative errors, estimated during weighting process}
 \item{wx}{Value of gamma for oprimal weighting on x} 
 \item{wy}{Value of gamma for oprimal weighting on y} 
 \item{yw}{Logical, if weighting on y gives better result than on x}
 \item{px}{Optimal Box-Cox power for transform of x variable}
 \item{py}{Optimal Box-Cox power for transform of y variable}


}
\references{ 

Almeida, A.M., Castel-Branco, M.M., Falcao, A.C. (2002) Linear regression for calibration lines
 revisited: weighting schemes for bioanalytical methods. J. Chromatogr. B Biomed. Sci. Appl.
 774, 215-222.

Nagaraja, N.V., Paliwal, J.K., Gupta, R.C. (1999) Choosing the calibration model in assay validation.
 J. Pharm. Biomed. Anal. 20, 433-438.

Kimanani, E.K., Lavigne, J. (1998) Bioanalytical calibration curves: variability of optimal powers
 between and within analytical methods. J. Pharm. Biomed. Anal. 16, 1107-1115.

Kirkup, L., Mulholland, M. (2004). Comparison of linear and non-linear equations
 in univariate calibration. J. Chromatogr. A, 1029, 1-11.

Kimanani, E.K. (1998) Bioanalitical calibration curves: proposal for statistical criteria.
 J. Pharm. Biomed. Anal. 16, 1117-1124.

Baumann, K., Waetzig, H. (1997) Regression and calibration for analytical separation techniques.
 Part I. Design considerations. Process Control and Quality, 10, 59-73.

Baumann, K. (1997) Regression and calibration for analytical separation techniques.
 Part II. Validation, weighted and robust regression. Process Control and Quality, 10, 75-112.

Coleman, D.E., Vanatta, L.E. (1999) Lack-of-fit testing of ion chromatographic calibration
 curves with inexact replicates. J. Chromatogr. A 850, 43-51.

}
\author{ Lukasz Komsta }
\seealso{ \code{\link{lm}}, \code{\link{rlm}}, \code{\link{boxcox}}}
\note{

	This function performs *no* decision which model should be chosen!
	Such decision should be always made by analyst.

}
\examples{
data(ibuprofen)
attach(ibuprofen)
fit = lmcal(conc,area)
fit
summary(fit)
}
\keyword{models}
