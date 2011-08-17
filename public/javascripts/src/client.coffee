$ ->
  source = $('#entry-template').html()
  console.log source
  source = source.replace('/n','')
  template = Handlebars.compile(source)
  context = {title: "handle bar title",body: "handlebar body"}
  html = template(context)
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
