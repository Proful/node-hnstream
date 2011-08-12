hn = require("../lib/hn")
assert = require("assert")

module.exports = {
  'test homepage': ()->
    hn.get "page",(data)->
      assert.isNotNull data
      assert.isDefined data
      assert.type data,'object'
}
