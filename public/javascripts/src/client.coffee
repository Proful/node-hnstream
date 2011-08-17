###
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

template = (id,data) ->
  # console.log "id: " + id
  source = $(id).html()
  source = source.replace(/\\n/g,"")
  template = Handlebars.compile(source)
  html = template(data)
  $('body').prepend(html)

# Streaming on front page news
# socket.on 'news', (data) ->
  # template '#entry-template', data

# Streaming on comments
socket.on 'comments', (data) ->
  console.log data
  # Bug: invoking the template function not able to render the template.
  # template '#comment-template', data
  source = $("#comment-template").html()
  source = source.replace(/\\n/g,"")
  template = Handlebars.compile(source)
  html = template(data)
  $('body').append(html)
