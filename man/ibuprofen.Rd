\name{ibuprofen, genisten, biochanin, pseudoephedrine, nitrate}
\alias{ibuprofen}
\alias{genisten}
\alias{biochanin}
\alias{pseudoephedrine}
\alias{nitrate}
\docType{data}
\title{ Calibration data for several compounds }
\description{
  A sample calibration data with two replicates for each standard.
}
\usage{
data(ibuprofen)
data(genisten)
data(biochanin)
data(pseudoephedrine)
data(nitrate)
}

\format{
  A data frames with 14 observations containing calibration curve of 5 compounds.
  \describe{
    \item{\code{conc}}{concentration of a standard}
    \item{\code{area}}{peak area (response)}
  }
}
\source{

  The data was originally published by Kirkup and Mulholland (2004) to discuss
  various calibration models.

}
\references{
  Kirkup, L., Mulholland, M. (2004). Comparison of linear and non-linear equations
	in univariate calibration. J. Chromatogr. A, 1029, 1-11.
}
\examples{
data(ibuprofen)
attach(ibuprofen)
fit = lmcal(conc,area)
summary(fit)
anova(fit)
par(mfrow=c(2,2))
plot(fit)
}
\keyword{datasets}
