angular
.module "weeselect.controllers.champList", []

.controller "ChampListCtrl", ($scope, ChampsService) ->
  $scope.champs = []

  ChampsService
    .getChampList()
    .then (champList) ->
      $scope.champs = champList.data
      console.log champList.data

  $scope.setActive = (index) ->
    $scope.champs[index].selected = !$scope.champs[index].selected


  $scope.selectNone = () ->
    $scope.champs.forEach (champ) ->
      champ.selected = no

  $scope.selectAll = () ->
    $scope.champs.forEach (champ) ->
      champ.selected = yes

  $scope.saveChamps = () ->
    selected = []

    for champ in $scope.champs
      selected.push(champ) if champ.selected

    console.log selected
    ChampsService.setChamps selected
