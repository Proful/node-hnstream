hn = require("../lib/hn")
assert = require("assert")

module.exports = {
  # test hn home page retrieval
  'test homepage': ()->
    hn.get "page",(data)->
      assert.isNotNull data                       # data not null
      assert.isDefined data                       # data is defined
      assert.type data,'object'                   # type of data is object. string is converted by json parser
      assert.length data['items'],30              # total items retrieved is 30
}
