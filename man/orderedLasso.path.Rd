\name{orderedLasso.path}
\alias{orderedLasso.path}
\title{Fit a path of ordered lasso models}
\usage{
orderedLasso.path(x, y, lamlist = NULL, minlam = NULL, maxlam = NULL,
  nlam = 50, flmin = 0.005, intercept = TRUE, standardize = TRUE,
  method = c("Solve.QP", "GG"), niter = 500, iter.gg = 100,
  strongly.ordered = FALSE, trace = FALSE, epsilon = 1e-05)
}
\arguments{
\item{x}{A matrix of predictors, where the rows are the samples and the columns are the predictors}

\item{y}{A vector of observations, where length(y) equals nrow(x)}

\item{lamlist}{Optional vector of values of lambda (the regularization parameter)}

\item{minlam}{Optional minimum value for lambda}

\item{maxlam}{Optional maximum value for lambda}

\item{nlam}{Number of values of lambda to be tried. Default nlam = 50}

\item{flmin}{Fraction of maxlam; minlam= flmin*maxlam. If computation is slow, try increasing
flmin to focus on the sparser part of the path}

\item{intercept}{True if there is an intercept in the model.}

\item{standardize}{Standardize the data matrix x. Default is TRUE.}

\item{method}{Two options available, Solve.QP and Generalized Gradient.}

\item{niter}{Number of iterations of ordered lasso, initialized to 500.}

\item{iter.gg}{Number of iterations of genearalized gradient; Default iter.gg = 100}

\item{strongly.ordered}{An option which allows users to order the coefficients non-decreasing in absolute value.
Details can be seen in the orderedLasso Description.}

\item{trace}{Output option; trace=TRUE gives verbose output}

\item{epsilon}{Error tolerance parameter for convergence criterion. Default is 1e-5}
}
\value{
\item{bp}{p by nlam  matrix of estimated positive coefficients(p=#variables)}
\item{bn}{p by nlam  matrix of estimated negative coefficients}
\item{beta}{p by nlam  matrix of estimated coefficients}
\item{b0}{a length nlam vector of estimated intercepts}
\item{lamlist}{Vector of values of lambda used}
\item{err}{Vector of errors}
\item{call}{The call to orderedLasso.path}
}
\description{
Fit a path of ordered lasso models over different values of the regularization parameter.
}
\examples{
set.seed(3)
n = 50
b = c(4,3,1,0)
p = length(b)
x = matrix(rnorm(n*p),nrow = n)
sigma = 5
y = x \%*\% b + sigma * rnorm(n, 0, 1)
path1 = orderedLasso.path(x,y, intercept =  FALSE, 
        method = "Solve.QP", strongly.ordered = TRUE)
plot(path1)
print(path1)
}

