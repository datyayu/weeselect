fs       = require 'fs'
mongoose = require 'mongoose'
_        = require 'lodash'
moment   = require 'moment'
async    = require 'async'
glob     = require 'glob'
Champ    = require '../api/champs/champ.model'


module.exports = (currentDir) ->
  console.log 'cool'
  # json files.
  files = glob.sync currentDir + '/../itemSets/**/*.json'


  # Get info from each file.
  async.eachSeries files, (file, eachFileCallback) ->
    jsonFile    = fs.readFileSync file, "utf8"
    champObject = JSON.parse jsonFile

    champName = champObject.champion
    builds    = champObject.blocks

    async.waterfall( [
          # Check if champ exists in db.
          (callback) ->
            Champ
              .find {id: champName}
              .exec (err, champList) ->
                return callback(err) if err
                return callback null, null if champList.length is 0

                callback null, champList[0]
        ,
          # Add champ to db if doesn't exist.
          (champ, callback) ->
            return callback(null, champ) if champ isnt null

            champInfo =
              name: champName.replace /([A-Z])/g, ' $1'
              id: champName
              image: "#{ champName }_0.jpg"
              min: "#{ champName }_Square_0.png"
              builds: [] # To be filled in next callback.

            newChamp = new Champ(champInfo)
            newChamp.createdAt = moment().unix()
            newChamp.updatedAt = moment().unix()

            newChamp.save (err, champ) ->
              return callback(err) if err

              callback null, champ
        ,
          # Add build to champs
          (champ, callback) ->
            buildList = []
            index = 0

            for build in builds
              if _.includes(build.type, 'Starters') or _.include(build.type, 'Consumables')
                continue

              buildList[index] =
                title: build.type
                items: build.items

              index++

            champ.builds = buildList

            champ.save (err, champ) ->
              return callback(err) if err

              callback null, "Builds for #{ champ.name } saved successfully"
      ]
    ,
      (err, result) ->
        return console.log(err) if err

        console.log "#{ file } parse completed"
        eachFileCallback()
    )
