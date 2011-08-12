http = require("http")

# url is the hn api path variable
# done is the callback method
get = (url,done)->
  options = {
    host: 'api.ihackernews.com',
    port: 80,
    path: "/#{url}"
  }

  http.get options,(res,err) ->
    data = ""
    # not sure whether calling toString in concatenate is the right approach.
    res.on 'data', (chunk)->
       data = data + chunk.toString()
    # sendign the data to done callback method
    res.on 'end', ()->
      done JSON.parse(data)

exports.get = get
