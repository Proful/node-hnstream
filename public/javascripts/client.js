(function() {
  /*
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
  */
  var socket, template;
  socket = io.connect("http://localhost");
  template = function(id, data) {
    var html, source;
    source = $(id).html();
    source = source.replace(/\\n/g, "");
    template = Handlebars.compile(source);
    html = template(data);
    return $('body').prepend(html);
  };
  socket.on('comments', function(data) {
    var html, source;
    console.log(data);
    source = $("#comment-template").html();
    source = source.replace(/\\n/g, "");
    template = Handlebars.compile(source);
    html = template(data);
    return $('body').append(html);
  });
}).call(this);
