library(sugaR)
library(puddingR)

h <- sugaR(name = "metapiTest",
          format_file = "vnd.no.met.data.sources-v0+json",
          auth_type = "basic",
          endpoint = NULL)


h$authenticate(user="YOUR-USERNAME",password="")

urlTest <- "https://data.met.no/tests/secureHello"

req <- puddingR()
req$set_handle(verb=h$info()$verb, option=h$info()$options,header=h$info()$headers )
req$request(url=urlTest) # status code = 200
resp <- response(req)

req$request(url=urlTest,filename="x.tmp") # status code = 401: reset_handle after everey request
resp <- response(req)

req$set_handle(verb=h$info()$verb, header=h$info()$headers, option=h$info()$options)
req$request(url=urlTest,filename="x.tmp") # status code = 200
resp <- response(req)

req$clearCache()
