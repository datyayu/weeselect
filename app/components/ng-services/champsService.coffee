angular
.module "weeselect.services.champsService", []

.service "ChampsService", ($http, $q)->
  @champs = []

  @setChamps = (champList) ->
    @champs = champList

  @getChamps = ->
    deferred = $q.defer()
    deferred.resolve @champs
    deferred.promise

  @getChampList = ->
    deferred = $q.defer()

    #TODO: Replace sample json for http request.
    $http
      .get "/app/assets/sampleChampList.json"
      .then (champList) ->
        deferred.resolve champList

    deferred.promise

  @getRandomChampFrom = (pool) ->
    deferred = $q.defer()

    #TODO: Replace sample json for http request.
    $http
      .get "/app/assets/sampleChamp.json"
      .then (champ) ->
        deferred.resolve champ

    deferred.promise

  return this
