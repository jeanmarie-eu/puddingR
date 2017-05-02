
cache.clear <- function(cachefile){
  if (file.exists(cachefile)) file.remove(cachefile)
  invisible()
}

cache.filePath <- function(cachePath,name){
  cachedir <- normalizePath(file.path(cachePath,".puddingR"),mustWork = FALSE)
  dir.create(cachedir, showWarnings = FALSE, recursive = TRUE)
  if(is.null(name)) {
    res <- normalizePath(tempfile(pattern = "file", tmpdir = cachedir, fileext = ""),mustWork = FALSE)
  } else res <- normalizePath(file.path(cachedir,paste0(".",name)),mustWork = FALSE)
  return(res)
}
