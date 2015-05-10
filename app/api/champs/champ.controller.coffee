###
 # Using Rails-like standard naming convention for endpoints.
 # GET     /api/releases              ->  index
 # POST    /api/releases              ->  create
 # GET     /api/releases/:id          ->  show
 # PUT     /api/releases/:id          ->  update
 # DELETE  /api/releases/:id          ->  destroy
###

# Dependencies
moment  = require 'moment'
_       = require 'lodash'
Champ   = require './champ.model'


# Get a list with all the champs and its id.
exports.index = (req, res) ->
  Champ
    .find {}
    .select 'name id thumbnail'
    .exec (err, champList) ->
      return res.send err if err

      res.send champList


exports.show = (req, res) ->
  champId = req.params.id

  Champ
    .find {id: champId}
    .select '-__v'
    .exec (err, champ) ->
      return res.send err if err
      return res.send "No champ was found using #{ champId }" if not champ[0]?
      console.log champ

      res.send champ[0] # Cero because mongoose's .find returns an array.
