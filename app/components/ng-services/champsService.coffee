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

    $http
      .get "/api/champs"
      .then (champList) =>
        deferred.resolve champList

    deferred.promise

  @getRandomChamp = ->
    deferred = $q.defer()

    if @champs.length is 0
      deferred.reject null

    else
      pool = []
      for champ, idx in @champs
        pool[idx] = champ.id

      $http
        .post "/api/champs/random", pool
        .then (champ) =>
          deferred.resolve champ

    deferred.promise


  @getLocalChampList = =>
    deferred = $q.defer()

    @getChampList()
      .then (champList) =>
        for champ in champList
          champ.selected = localStorage.getItem(champ.id) is 'true'
        @champs = champList
        deferred.resolve champList

    deferred.promise


  return this
