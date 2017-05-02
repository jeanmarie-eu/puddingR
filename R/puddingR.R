#' puddingR
#'
#' puddingR
#' @param cachePath path of the cache
#' @keywords puddingR
#' @export
#' @examples
#' \dontrun{
#' puddingR()
#' }
puddingR <- function(cachePath="~\\") {
  puddingR_object(cachePath)
}

puddingR_object <- function(cachePath){

  resp <- list()
  handle <- NULL

  object <- local({

    set_handle <- function(verb=NULL,option=NULL,header=NULL,body=NULL,auth_token=NULL){
      handle <<- request_set_handle(verb=verb,option=option,header=header,body=body,auth_token=auth_token)

      #invisible()
    }

    request <- function(url,filename=NULL){
      cachefile <- cache.filePath(cachePath=cachePath,name=filename)
      resp <<- request_process(url,handle,path=cachefile)
      invisible()
    }

    clearCache <- function(){
      if (!is.null(resp$content)) cache.clear(resp$content)
      resp <<- list()
      invisible()
    }

    response <- function(){
      return(resp)
    }

    environment()
  })
  lockEnvironment(object, TRUE)
  structure(object, class=c("puddingR", class(object)))
}
