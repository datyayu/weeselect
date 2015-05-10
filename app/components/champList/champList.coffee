angular
.module "weeselect.controllers.champList", []

.controller "ChampListCtrl", ($scope, ChampsService) ->
  $scope.champs = []

  ChampsService
    .getChampList()
    .then (champList) ->
      $scope.champs = champList.data
      for champ in $scope.champs
        champ.selected = localStorage.getItem(champ.id) is 'true'


  # Add or remove a champion from the pool.
  $scope.setActive = (index) ->
    champ = $scope.champs[index]
    champ.selected = !champ.selected
    localStorage.setItem champ.id, champ.selected


  # Remove all champs from the pool.
  $scope.selectNone = ->
    $scope.champs.forEach (champ) ->
      champ.selected = no
      localStorage.setItem champ.id, no


  # Add all champs to the pool.
  $scope.selectAll = ->
    $scope.champs.forEach (champ) ->
      champ.selected = yes
      localStorage.setItem champ.id, yes


  # Save to current service array.
  $scope.saveChamps = ->
    selected = []

    for champ in $scope.champs
      selected.push(champ) if champ.selected

    ChampsService.setChamps selected
