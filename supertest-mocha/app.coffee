express   = require('express')
http      = require('http')
path      = require('path')
app       = module.exports = express()

app.configure ->
  app.set('port', process.env.PORT || 3000)
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);


app.configure 'development', ->
  app.use express.errorHandler()


app.get '/', (req, resp) ->
  resp.send "hello world"

app.get '/delay', (req, resp) ->
  setTimeout ->
    resp.send "hello world delayed"
  , 500

app.get '/json', (req, resp) ->
  res.send 201, name: 'testsuser'


http.createServer(app).listen app.get('port'), ->
  console.log("Express server listening on port " + app.get('port'))

