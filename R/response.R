#' response
#'
#' response
#' @param obj puddingR object
#' @keywords puddingR
#' @export
#' @examples
#' \dontrun{
#' response()
#' }
response <- function(obj) {
   stopifnot(inherits(obj,"puddingR"))
   header <- curl::parse_headers(obj$response()$header)
   status_code <- obj$response()$status_code
   return(list(header = header,
     status_code = status_code))
}
