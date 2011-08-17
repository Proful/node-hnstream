(function() {
  $(function() {
    var html, result, source, template;
    result = $('#json-test').html();
    result = result.replace(/\\n/g, "");
    result = JSON.parse(result);
    console.log(result);
    source = $('#entry-template').html();
    source = source.replace(/\\n/g, "");
    template = Handlebars.compile(source);
    html = template(result);
    return $('body').append(html);
  });
  /*
  socket = io.connect "http://localhost"
  
  socket.on 'news', (data) ->
    console.log data
    source = $('#entry-template').html()
    source = source.replace('/n','')
    template = Handlebars.compile(source)
    context = {title: "handle bar title",body: "handlebar body"}
    html = template(context)
    $('body').append(html)
  */
}).call(this);
