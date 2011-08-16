#socket = new io.Socket 'http://localhost/',{port:80}
socket = io.connect "http://localhost"

socket.on 'news', (data) ->
  console.log data
  socket.emit 'my other event', {my: 'data'}
