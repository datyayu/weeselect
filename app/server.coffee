# Dependencies.
path       = require 'path'
express    = require 'express'
bodyParser = require 'body-parser'
mongoose   = require 'mongoose'
routes     = require './routes'
champAdder = require './libs/champAdder'

# Local variables.
app  = express()
port = process.env.PORT || 8000

# Database connection.
url = process.env.MONGOLAB_URI || 'mongodb://localhost/weeselect'
mongoose.connect url

# Midlewate
app.use bodyParser.json()

# Add Builds
champAdder __dirname

# Routes
app.use routes


# Start app.
app.listen port, ->
  console.log "Server listening on port #{ port }"
