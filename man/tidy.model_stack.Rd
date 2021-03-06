% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidiers.R
\name{tidy.model_stack}
\alias{tidy.model_stack}
\title{Tidy a \code{model_stack} object}
\usage{
\method{tidy}{model_stack}(x, ...)
}
\arguments{
\item{x}{A \code{model_stack} object}

\item{...}{Additional arguments. Currently ignored.}
}
\value{
A \code{\link[tibble:tibble]{tibble::tibble()}} a tibble with as many rows as
there are members, where each row gives \code{glance}-like results for that
model, as well as the stacking coefficients for those members. Output
columns will vary by the model stack's mode as well as the availability
of the members' tidying methods.
}
\description{
Tidy accepts a model object and summarizes information about the
components of a model. In the case of model stacks, these "components"
are the trained members.

Please note that this method is only implemented for model stacks
with \emph{fitted} members!
}
\section{Example Data}{


These examples make use of data and resampling objects exported with the
package. All of them are derived from test cases making use of the
\code{penguins} dataset from Allison Horst's \code{palmerpenguins} package.

The \code{penguins_train} and \code{penguins_test} objects are subsets of the
penguins data for using in training and testing, respectively.

Objects containing the substring \verb{_res_} are \code{tune_results} objects
for model specifications. The \code{reg} prefix indicates that the model
definition is for use in regression, \code{class} indicates multinomial
classification, and \code{log} (as in logistic) indicates binomial classification.
The suffix indicates the model definition type. All of these \code{tune_results}
objects are fitted on a 5-fold cross validation of the \code{penguins_train} data.

For the regression setting, these \code{tune_results} objects reflect
models specified to fit \code{body_mass_g} using all of the other variables
as predictors. These objects include:
\itemize{
\item \code{reg_res_lr}: Fitted resamples for a linear regression model
\item \code{reg_res_sp}: Tuning results for a splines model
\item \code{reg_res_svm}: Tuning results for a support vector machine model
}

In the multinomial classification setting, the relevant objects reflect
models specified to fit \code{year} (as a factor) using all of the other variables
as predictors. These objects include:
\itemize{
\item \code{class_res_nn}: Fitted resamples for a neural network model
\item \code{class_res_rf}: Tuning results for a random forest model
}

In the binomial classification setting, the relevant objects reflect models
specified to fit \code{sex} using all of the other variables as predictors.
These objects include:
\itemize{
\item \code{log_res_nn}: Fitted resamples for a neural network model
\item \code{log_res_rf}: Tuning results for a random forest model
}

See \code{?example_data} to learn more about these objects, as well as browse
the source code that generated them.
}

\examples{
\donttest{
# see the "Example Data" section above for
# clarification on the data and tuning results
# objects used in these examples!

# to use the `tidy` method, the appropriate glance
# methods must be loaded for the member model tidiers.
# in this example, they come from broom!
library(broom)

# build a regression model stack
st <-
  stacks() \%>\%
  add_candidates(reg_res_lr) \%>\%
  add_candidates(reg_res_sp) \%>\%
  blend_predictions() \%>\%
  fit_members()
  
# check the model stack out!
tidy(st)
glance(st)
augment(st)
}

}
\seealso{
Other tidiers: 
\code{\link{augment.model_stack}()},
\code{\link{glance.model_stack}()}
}
\concept{tidiers}
