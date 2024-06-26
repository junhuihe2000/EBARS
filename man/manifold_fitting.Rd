% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/manifold_fitting.R
\name{manifold_fitting}
\alias{manifold_fitting}
\title{Fit an 1 or 2 dimensional manifold with EBARS}
\usage{
manifold_fitting(x, d, embedding_map)
}
\arguments{
\item{x}{a numeric matrix, (n,p), each row indicates a point in R^p.}

\item{d}{int, the intrinsic dimension.}

\item{embedding_map}{function, with the usage \code{embedding_map(x,d)},
return the embedding representation, a numeric matrix with dim(n,d).}
}
\value{
a list including:
\itemize{
\item{\code{map}, the estimated reconstruction map.}
\item{\code{u}, the manifold projection.}
\item{\code{fitted}, the manifold estimation on \code{u}.}
}
}
\description{
Fit an 1 or 2 dimensional manifold with EBARS
}
\examples{
manifold=function(t){ return(c(cos(t),sin(t)))}
I=100
t=runif(I,min = 0,max = 1.5*pi)
X=manifold(t)
sd.noise=0.05
e1=rnorm(I,mean = 0, sd=sd.noise)
e2=rnorm(I,mean = 0, sd=sd.noise)
data.points=X+cbind(e1,e2)
embedding_map <- function(x, d) {
  u = stats::princomp(x)$scores[,1,drop=FALSE]
  return(u)
}
res = manifold_fitting(data.points,1,embedding_map)
x_test = res$fitted
plot(data.points[,1], data.points[,2],
pch=20, col="grey",
main="Principal Manifold Estimation",
xlab=" ", ylab=" ")
lines(x_test[,1],x_test[,2],col="red",type = "l",lwd=3)
}
