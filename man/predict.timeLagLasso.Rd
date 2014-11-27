\name{predict.timeLagLasso}
\alias{predict.timeLagLasso}
\title{make predictions from a fitted "timeLagLasso" object}
\usage{
\method{predict}{timeLagLasso}(object, newdata = NULL, ...)
}
\arguments{
\item{object}{fitted "timeLagLasso" model}

\item{newdata}{Matrix of new values for object at which predictions are to be made.}

\item{...}{Not used. Other arguments to predict.}
}
\value{
\item{yhat}{fitted y values}

\item{yhat.ordered}{fitted y values of the strongly ordered coefficients}
}
\description{
Similar to other predict methods, this functions predicts fitted values from a fitted "timeLagLasso" object.
}

