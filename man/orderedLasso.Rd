\name{orderedLasso}
\alias{orderedLasso}
\title{Fit an ordered lasso}
\usage{
orderedLasso(x, y, lambda, intercept = TRUE, b0 = NULL, beta_pos = NULL,
  beta_neg = NULL, method = c("Solve.QP", "GG"), strongly.ordered = FALSE,
  standardize = TRUE, trace = FALSE, niter = 500, iter.gg = 100,
  epsilon = 1e-08)
}
\arguments{
\item{x}{A matrix of predictors, where the rows are the samples and the columns are the predictors}

\item{y}{A vector of observations, where length(y) equals nrow(x)}

\item{lambda}{Regularization parameter(>0)}

\item{intercept}{TRUE if there is an intercept in the model.}

\item{b0}{Initial value for the intercept.}

\item{beta_pos}{Optional vector of initialization of the positive part of the coefficients.}

\item{beta_neg}{Optional vector of initialization of the negative part of the coefficients.}

\item{method}{Two options available, Solve.QP and Generalized Gradient. Solve.QP uses the package quadprog to solve a quadratic programming
problem. GG stands for genearlized gradient. GG uses proximal genearalized gradient algorithm to solve the problem. Detailed can be seen
in the paper refered in the description.}

\item{strongly.ordered}{An option which allows users to order the coefficients in absolute value. The coefficients returned by the orderedLasso
may not be monotone non-increasing in absolute value even though the positive parts and negative parts are monotone non-increasing.
Details can be seen in the paper referred in the Description. Strongly.ordered options returns the coefficients monotone non-increasing in absolute value.}

\item{standardize}{Standardize the data matrix x}

\item{trace}{Output option; trace = TRUE gives verbose output}

\item{niter}{Maximum number of iterations; default 500.}

\item{iter.gg}{Number of iterations of genearalized gradient; default 100}

\item{epsilon}{Error tolerance parameter for convergence criterion ; default 1e-05.}
}
\value{
\item{bp}{Estimated coefficients- positive part}
\item{bn}{Estimated coefficients- negative part}
\item{beta}{Estimated coefficients, which are equal to bp - bn}
\item{b0}{Estimated intercept, if there is one in the model. }
\item{fitted}{Fitted values of y}
\item{type}{Type of model fit, "gaussian"}
\item{call}{The call to orderedLasso}
}
\description{
One of the main functions. Ordered Lasso builds a regression model with an L1-constraint imposed on the coefficients.
The coefficients are re-written as negative and positive parts and the model requires positive and negative parts are
monotone non-increasing and positive.
}
\examples{
set.seed(3)
n = 50
b = c(7,3,1,0)
p = length(b)
x = matrix(rnorm(n*p),nrow = n)
sigma = 4
y = x \%*\% b + sigma * rnorm(n, 0, 1)
result1 = orderedLasso(x,y, lambda = 1, intercept =TRUE, standardize = TRUE,
          method = "GG", strongly.ordered = TRUE)
result2 = orderedLasso(x,y, lambda = 1, intercept = TRUE, standardize =TRUE,
          strongly.ordered = TRUE)
print(result1)
print(result2)
}

