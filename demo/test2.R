
library(sugaR)
library(puddingR)


#############################################

h <- sugaR(name = "test",auth_type = "none",endpoint = NULL)

h$authenticate(user="YOUR-USERNAME",password="")
h$verb("GET")
h$header("accept","json")
h$info()

urlTest <- "http://httpbin.org/get"

req <- puddingR()
req$set_handle(verb=h$info()$handle$verb, header=h$info()$handle$headers, option=h$info()$handle$options)
req$request(url=urlTest,filename="x.tmp") # status code = 200
resp <- response(req)

##################################################

h <- sugaR(name = "test",auth_type = "none",endpoint = NULL)

h$authenticate()
h$verb("POST")
h$header("accept","json")
h$body(list(x="A simple text string"),"json")
h$info()

urlTest <- "http://httpbin.org/post"

req <- puddingR()
#req$set_handle(verb=h$info()$handle$verb, header=h$info()$handle$headers, body=h$info()$handle$body, option=h$info()$handle$options)
req$set_handle(verb=h$info()$handle$verb, header=h$info()$handle$headers,  body=h$info()$handle$body, option=h$info()$handle$options)
req$request(url=urlTest,filename="x.tmp") # status code = 200
resp <- response(req)

################################

h <- sugaR(name = "test",auth_type = "none",endpoint = NULL)

h$authenticate()
h$verb("POST")
h$header("accept","json")
h$body("A simple text string")
h$info()

urlTest <- "http://httpbin.org/post"

req <- puddingR()
#req$set_handle(verb=h$info()$handle$verb, header=h$info()$handle$headers, body=h$info()$handle$body, option=h$info()$handle$options)
req$set_handle(verb=h$info()$handle$verb, header=h$info()$handle$headers,  body=h$info()$handle$body, option=h$info()$handle$options)
req$request(url=urlTest,filename="x.tmp") # status code = 200
resp <- response(req)
