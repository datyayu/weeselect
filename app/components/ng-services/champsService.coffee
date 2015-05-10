angular
.module "weeselect.services.champsService", []

.service "ChampsService", ($http, $q)->
  @champs = []

  @setChamps = (champList) ->
    @champs = champList

  @getChamps = ->
    @champs


  @getChampList = ->
    deferred = $q.defer()

    $http
      .get "/api/champs"
      .then (champList) =>
        for champ in champList.data
          champ.selected = localStorage.getItem(champ.id) is 'true'
        deferred.resolve champList.data

    deferred.promise

  @getRandomChamp = (pool) ->
    deferred = $q.defer()

    if pool.length is 0
      deferred.reject null

    $http
      .post "/api/champs/random", pool
      .then (champ) =>
        deferred.resolve champ.data

    deferred.promise

  @getLocalChamps = ->
    champIDs = []
    for champ in Object.keys(localStorage)
      champIDs.push champ if localStorage.getItem(champ) is 'true'

    return champIDs


  return this
