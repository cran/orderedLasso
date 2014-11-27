\name{orderedLasso.cv}
\alias{orderedLasso.cv}
\title{Cross-validation function for the ordered lasso}
\usage{
orderedLasso.cv(x, y, lamlist = NULL, minlam = NULL, maxlam = NULL,
  nlam = 50, flmin = 5e-04, strongly.ordered = FALSE, intercept = TRUE,
  standardize = TRUE, nfolds = 10, folds = NULL, niter = 500,
  iter.gg = 100, method = c("Solve.QP", "GG"), trace = FALSE,
  epsilon = 1e-05)
}
\arguments{
\item{x}{A matrix of predictors, where the rows are the samples and the columns are the predictors}

\item{y}{A vector of observations, where length(y)  equals nrow(x)}

\item{lamlist}{Optional vector of values of lambda (the regularization parameter)}

\item{minlam}{Optional minimum value for lambda}

\item{maxlam}{Optional maximum value for lambda}

\item{nlam}{Number of values of lambda to be tried. Default nlam = 50.}

\item{flmin}{Fraction of maxlam minlam= flmin*maxlam. If computation is slow, try increasing
flmin to focus on the sparser part of the path. Default flmin = 1e-4.}

\item{strongly.ordered}{An option which allows users to order the coefficients in absolute value.}

\item{intercept}{True if there is an intercept in the model.}

\item{standardize}{Standardize the data matrix.}

\item{nfolds}{Number of cross-validation folds.}

\item{folds}{(Optional) user-supplied cross-validation folds.  If provided, nfolds is ignored.}

\item{niter}{Number of iterations the ordered lasso takes to converge. Default nither = 500.}

\item{iter.gg}{Number of iterations of generalized gradient method; default 100}

\item{method}{Two options available, Solve.QP and Generalized Gradient.
Details of two options can be seen in the orderedLasso description.}

\item{trace}{Output option; trace=TRUE gives verbose output}

\item{epsilon}{Error tolerance parameter for convergence criterion; default 1e-5}
}
\description{
Uses cross-validation to estimate the regularization parameter for the ordered lasso model.
}
\examples{
set.seed(3)
n = 50
b = c(4,3,1,0)
p = length(b)
x = matrix(rnorm(n*p),nrow = n)
sigma = 5
y = x \%*\% b + sigma * rnorm(n, 0, 1)
cvmodel = orderedLasso.cv(x,y, intercept = FALSE, trace = TRUE, 
          method = "Solve.QP", strongly.ordered = TRUE)
print(cvmodel)
plot(cvmodel)
}

