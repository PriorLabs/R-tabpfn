#' TabPFN Base Estimator
#'
#' An R6 class to for both TabPFNClassifier and TabPFNRegressor
#'
#' @docType class
#' @import R6
#' @import reticulate
TabPFNBase <- R6Class("TabPFNBase",
  public = list(
    #' @field estimator Python TabPFNClassifier or TabPFNRegressor instance.
    estimator = NULL,
    #' @description Create a new TabPFNClassifier
    initialize = function() {
    },

    #' Fit data, will simply upload the data to the server
    #'
    #' @param X A data frame or matrix of features.
    #' @param y A vector of target values.
    fit = function(X, y) {
      if (!is.data.frame(X) && !is.matrix(X)) {
        stop("X must be a data frame or matrix.")
      }
      if (!is.vector(y)) {
        stop("y must be a vector.")
      }

      # Convert R data to Python objects
      X_py <- np$array(reticulate::r_to_py(as.matrix(X)))
      y_py <- np$array(reticulate::r_to_py(as.vector(y)))

      tryCatch(
        {
          self$estimator$fit(X_py, y_py)
        },
        error = function(e) {
          stop("Error during fitting: ", e$message)
        }
      )
    },

    #' Predict the data.
    #'
    #' @param X A data frame or matrix of features.
    #' @return A vector of predictions.
    predict = function(X) {
      if (!is.data.frame(X) && !is.matrix(X)) {
        stop("X must be a data frame or matrix.")
      }

      # Convert R data to Python objects
      X_py <- np$array(reticulate::r_to_py(as.matrix(X)))

      tryCatch(
        {
          predictions <- self$estimator$predict(X_py)
          return(reticulate::py_to_r(predictions))
        },
        error = function(e) {
          stop("Error during prediction: ", e$message)
        }
      )
    }
  )
)

#' TabPFN Classifier
#'
#' An R6 class to interface with the Python TabPFNClassifier.
#'
#' @docType class
#' @import R6
#' @import reticulate
#' @export
TabPFNClassifier <- R6::R6Class("TabPFNClassifier",
  inherit = TabPFNBase,
  public = list(
    #' @description Create a new TabPFNClassifier
    initialize = function() {
      # Import Python modules
      tabpfn <- reticulate::import("tabpfn_client", convert = FALSE)
      # Initialize the Python TabPFNClassifier
      self$estimator <- tabpfn$TabPFNClassifier()
    }
  )
)


#' TabPFN Regressor
#'
#' An R6 class to interface with the Python TabPFNClassifier.
#'
#' @docType class
#' @import R6
#' @import reticulate
#' @export
TabPFNRegressor <- R6::R6Class("TabPFNRegressor",
  inherit = TabPFNBase,
  public = list(
    #' @description Create a new TabPFNRegressor
    initialize = function() {
      # Import Python modules
      tabpfn <- reticulate::import("tabpfn_client", convert = FALSE)
      # Initialize the Python TabPFNRegressor
      self$estimator <- tabpfn$TabPFNRegressor()
    }
  )
)
