express = require("express")
io = require("socket.io").listen(app)
app = module.exports = express.createServer()
app.configure ->
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(__dirname + "/public")

app.configure "development", ->
  app.use express.errorHandler(
    dumpExceptions: true
    showStack: true
  )

app.configure "production", ->
  app.use express.errorHandler()

app.get "/", (req, res) ->
  res.render "index", title: "Express"

app.listen 80
console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env


io.sockets.on 'connection',(socket) ->
  socket.emit 'news', {hello:'world'}
  socket.on 'my other event',(data) ->
    console.log data
