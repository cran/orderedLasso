\name{predict.orderedLasso.path}
\alias{predict.orderedLasso.path}
\title{make predictions from a fitted "orderedLasso.path" object}
\usage{
\method{predict}{orderedLasso.path}(object, newdata, s = NULL,
  exact = FALSE, ...)
}
\arguments{
\item{object}{fitted "orderedLasso.path" model}

\item{newdata}{Matrix of new values for object at which predictions are to be made.}

\item{s}{Value(s) of the penalty parameter lambda at which predictions are required. Default is the entire sequence used to create the model.}

\item{exact}{If exact = TRUE, and predictions are to made at values of s not included in the original fit, these values of s are merged with object$lambda,
and the model is refit before predictions are made. If exact = FALSE (default), then the predict function uses linear interpolation to make predictions for values of s
that do not coincide with those used in the fitting algorithm. Note that exact = TRUE is fragile when used inside a nested sequence of function calls. predict.orderedLasso() needs
to update the model, and expects the data used to create it to be around.}

\item{...}{Not used. Other arguments to predict.}
}
\value{
\item{nfit}{A matrix or a vector of fitted values}
}
\description{
Similar to other predict methods, this functions predicts fitted values from a fitted "orderedLasso" object.
}

