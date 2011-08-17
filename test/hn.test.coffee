hn = require("../lib/hn")
assert = require("assert")
fs = require("fs")

module.exports = {
  # test hn home page retrieval
  'test homepage': ()->
    hn.get "page",(data)->
      assert.isNotNull data                       # data not null
      assert.isDefined data                       # data is defined
      assert.type data,'object'                   # type of data is object. string is converted by json parser
      assert.length data['items'],30              # total items retrieved is 30

  'test comments streaming': ()->
    comments1 = fs.readFileSync "./testdata/hn.comments.1.json"
    comments1 = JSON.parse(comments1)
    commentId = comments1['comments'][0]['id']
    postedBy  = comments1['comments'][0]['postedBy']

    comments2 = fs.readFileSync "./testdata/hn.comments.2.json"
    comments2 = JSON.parse(comments2)
    comments2 = hn.rmOldComments comments2, commentId, postedBy

    assert.isNotNull comments2
    assert.isDefined comments2
}
