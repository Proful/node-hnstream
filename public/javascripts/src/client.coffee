$ ->
  # for testing
  result = $('#json-test').html()
  result = result.replace(/\\n/g,"")
  result = JSON.parse(result)
  console.log result
  # end of testing code
  source = $('#entry-template').html()
  source = source.replace(/\\n/g,"")
  template = Handlebars.compile(source)
  #context = {title: "handle bar title",body: "handlebar body"}
  html = template(result)
  $('body').append(html)
# Socket connection
###
socket = io.connect "http://localhost"

socket.on 'news', (data) ->
  console.log data
  source = $('#entry-template').html()
  source = source.replace('/n','')
  template = Handlebars.compile(source)
  context = {title: "handle bar title",body: "handlebar body"}
  html = template(context)
  $('body').append(html)
###
