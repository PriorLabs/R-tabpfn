#' Set TabPFN Access Token
#'
#' This function sets the access token required to authenticate with the TabPFN service.
#'
#' @param access_token A string representing the access token.
#' @export
set_tabpfn_access_token <- function(access_token) {
  message("Access token has been set.")
  tabpfn <- reticulate::import("tabpfn_client", convert = FALSE)
  tabpfn$set_access_token(access_token)
}
