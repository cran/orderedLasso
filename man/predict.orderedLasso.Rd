\name{predict.orderedLasso}
\alias{predict.orderedLasso}
\title{make predictions from a fitted "orderedLasso" object}
\usage{
\method{predict}{orderedLasso}(object, newdata, ...)
}
\arguments{
\item{object}{fitted "orderedLasso" model}

\item{newdata}{Matrix of new values for object at which predictions are to be made.}

\item{...}{Not used. Other arguments to predict.}
}
\value{
\item{yhat}{fitted y values}
}
\description{
Similar to other predict methods, this functions predicts fitted values from a fitted "orderedLasso" object.
}

