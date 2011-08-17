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
      # console.log data
      done JSON.parse(data)

# data is JSON object
# id: previous comment id
# postedBy: previous comment posted by
# in the ihackernewsapi id is not refering to actual comment id in hn
# so I am passing postedBy to make some what unique combination
rmOldComments = (data,id,postedBy) ->
  # console.log data
  # console.log id + " >> " + postedBy

  i = 0
  isOldComment = false
  commentsLength = data['comments'].length
  while i < commentsLength
    if not isOldComment and data['comments'][i]['id'] is id
      isOldComment = true

    if isOldComment
      delete data['comments'][i]

    i++

  # returning the modified data
  data

exports.get = get
exports.rmOldComments = rmOldComments
