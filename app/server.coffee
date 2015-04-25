# Dependencies.
path       = require "path"
router     = require "./routes"
bodyParser = require "body-parser"
express    = require "express"

# Local variables.
app       = express()
port      = process.env.PORT || 8000

# Assets files
assetsDir = path.join __dirname, "assets"
indexFile = path.join __dirname, "assets", "html" ,"index.html"

# App config.
app.use bodyParser.json()
app.use "/app/assets", express.static(assetsDir)

# Send main html file.
app.get "*", (req, res) ->
  res.sendFile indexFile

# Start app
app.listen port, ->
  console.log "Server listening on port #{ port }"
