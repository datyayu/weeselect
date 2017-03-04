# Dependencies.
path       = require 'path'
express    = require 'express'
api        = require './api'

# Local variables.
router = express.Router()

# Assets files.
assetsDir = path.join __dirname, 'assets'
indexFile = path.join __dirname, 'assets', 'html' ,'index.html'
dynoFile = path.resolve __dirname, '..', 'wakemydyno.txt'

# App config.
router.use '/assets', express.static(assetsDir)
router.use '/api', api

router.use '/wakemydyno.txt', (req, res) ->
  res.sendFile dynoFile

# Send main html file.
router.get '*', (req, res) ->
  res.sendFile indexFile


# Export the router.
module.exports = router
