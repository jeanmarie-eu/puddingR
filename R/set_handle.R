
request_set_handle <- function(verb,option,header,body,auth_token){
  header <-check_headers(header)
  verb <- check_methods(verb)
  option <- check_options(option)
  body <- check_body(body)
  auth_token <- check_auth_token(auth_token)

  handle <- new_handle()

  set_verb(handle,verb)
  set_option(handle,option)
  set_header(handle,header)
  set_body(handle,body)
  # set_auth_token(handle,auth_token) # to be continued

  return(handle)
}

check_headers <- function(header){
  stopifnot((!is.null(header)))
  stopifnot(is.list(header))
  return(header)
}

check_methods <- function(method){
  stopifnot((!is.null(method)))
  stopifnot(is.character(method), length(method) == 1)
  return(method)
}

check_options <- function(option){
  stopifnot(is.null(option) || is.list(option))
  return(option)
}

check_body <- function(body){
  stopifnot(is.null(body) || is.list(body))
  return(body)
}

#to be written
check_auth_token <- function(auth_token=NULL){
  return(auth_token)
}

set_verb <- function(handle,verb) {
  list_verb <- list()
  switch(verb,
    "GET" = list_verb$httpget <- TRUE,
    "POST"= list_verb$post <- TRUE,
    # to be continued ...
    (message=paste0("method not valid: ", verb,".")))
  curl::handle_setopt(handle, .list = list_verb)
  invisible()
}

set_option <- function(handle,option){
   curl::handle_setopt(handle, .list = option)
   invisible()
}

set_body <- function(handle,body){
  if (!is.null(body)) {
     curl::handle_setopt(handle, .list = body)
  }
}

set_header <- function(handle,header){
  curl::handle_setheaders(handle, .list = header)
  invisible()
}

new_handle <- function(){
  return(curl::new_handle())
}
