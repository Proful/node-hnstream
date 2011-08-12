socket = new io.Socket 'localhost', {port: 3000}

if socket.connect()
  socket.on 'news', (data) ->
    console.log data
    socket.emit 'my other event', {my: 'data'}
else
  console.log "not able to connect"
