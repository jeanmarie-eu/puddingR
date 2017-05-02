# puddingR

[![Travis-CI Build Status](https://travis-ci.org/jeanmarielepioufle/timeManip.svg?branch=master)](https://travis-ci.org/jeanmarielepioufle/puddingR)

puddingR focuses on getting data from remote service.

This is an interface for curl.

Output is raw data.

## Installation

```R
# install.packages("devtools")
devtools::install_github("jeanmarielepioufle/puddingR")
```

## Usage

```R
# install.packages("jeanmarielepioufle/sugaR")
library(sugaR)
library(puddingR)

# test 1
h <- sugaR(name = "test",auth_type = "none",endpoint = NULL)

h$authenticate()
h$verb("POST")
h$header("accept","json")
h$body(list(x="A simple text string"),"json")
h$info()

urlTest <- "http://httpbin.org/post"

req <- puddingR()
req$set_handle(verb=h$info()$handle$verb, header=h$info()$handle$headers,  body=h$info()$handle$body, option=h$info()$handle$options)
req$request(url=urlTest,filename="x.tmp") # status code = 200
resp <- response(req)

# test 2

h <- sugaR(name = "test",auth_type = "none",endpoint = NULL)

h$authenticate()
h$verb("POST")
h$header("accept","json")
h$body("A simple text string")
h$info()

urlTest <- "http://httpbin.org/post"

req <- puddingR()
req$set_handle(verb=h$info()$handle$verb, header=h$info()$handle$headers,  body=h$info()$handle$body, option=h$info()$handle$options)
req$request(url=urlTest,filename="x.tmp") # status code = 200
resp <- response(req)
```

I am working on making a vignette.

## Questions and remarks
Don't hesitate to contact me for more details and suggestions.
