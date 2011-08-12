(function() {
  var socket;
  socket = new io.Socket('localhost', {
    port: 3000
  });
  if (socket.connect()) {
    socket.on('news', function(data) {
      console.log(data);
      return socket.emit('my other event', {
        my: 'data'
      });
    });
  } else {
    console.log("not able to connect");
  }
}).call(this);
