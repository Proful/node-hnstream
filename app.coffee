express = require("express")
# app should be initialize before using socket.io
# because of this sily mistake I spent countless hours :)
app = module.exports                   = express.createServer()
io  = require("socket.io").listen(app)
hn  = require("./lib/hn")

app.listen 80
console.log "Express server listening on port %d in %s mode", app.address().port, app.settings.env

app.configure ->
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.register ".html",require("jade")
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
  res.render "index", title: "Hacker News Front Page"

# Establishes connection with client
# Retrieve hacker news front page
# On retrieval emit result to the client.
io.sockets.on 'connection',(socket) ->
  # front page news
  hn.get "page", (result) ->
    socket.emit 'news', result

  # new comments
  hn.get "newcomments", (result) ->
    socket.emit 'comments', result
