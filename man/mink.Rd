\name{mink}
\alias{mink}
\docType{data}
\title{
American mink \emph{Neovison vison} data.}
\description{
The mink data is the data analyzed by Fuller \emph{et al.} (2016) in their \emph{Ecological Applications} paper.
}
\usage{data("mink")}
\format{
  The format is:
 chr "mink"
}
\details{
  mink.sf = scrFrame

  mink.cs = cost surface DF

  mink.ss = state-space object

  Mecol = ecological distance model fit object (see Examples)

  Meuc = Euclidean distance model fit object (see Examples)
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
Fuller AK, Sutherland CS, Royle JA, Hare MP. \emph{Estimating population density and connectivity of American mink using spatial capture�recapture}. Ecological Applications. 2016 Jun 1;26(4):1125-35.
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}

\examples{

  library(oSCR)
  data(mink)

  # Compare Ecological and Euclidean models using a well supported model structure

  # desnity: D ~ D2city
  # detetection: p ~ sex
  # sigma: sig ~ sex

  #Euclidean
  mEuc <- oSCR.fit(model = list(D~D2city, p0~sex, sig~sex),
                   scrFrame= mink.sf, ssDF = mink.ss, trimS=2,
                   distmet = "euc")

  #Ecological
  mEcol <- oSCR.fit(model = list(D~D2city, p0~sex, sig~sex, asu~d2water),
                    scrFrame= mink.sf, ssDF = mink.ss, costDF = mink.cs,
                    trimS=2, distmet = "ecol")

  (fl <- fitList.oSCR(list(mEuc,mEcol),rename=T))
  (ms <- modSel.oSCR(fl))
  ms$aic
  ms$coef
}

\keyword{datasets}
