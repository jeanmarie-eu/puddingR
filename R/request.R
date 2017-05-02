
request_process <- function(url, handle, path) {
  resp <- curl::curl_fetch_disk(url=url, path=path, handle = handle)
  resp$content <- resp$content
  resp$cookies <- curl::handle_cookies(handle)
  curl::handle_reset(handle)
  return(resp)
}
