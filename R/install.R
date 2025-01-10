#' Install TabPFN and its dependencies
#'
#' @md
#'
#' @inheritParams reticulate::py_install
#'
#' @export
install_tabpfn <-
function(envname = "r-tabpfn") {
  reticulate::py_install(c("numpy", "pandas", "scikit-learn"), envname = envname)
  reticulate::py_install("git+https://github.com/PriorLabs/tabpfn-client.git", envname = envname)
}
