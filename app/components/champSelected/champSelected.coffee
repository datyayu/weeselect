angular
.module "weeselect.controllers.champSelected", []

.controller "ChampSelectedCtrl", ($scope, ChampsService) ->
  $scope.champ = null

  ChampsService
    .getRandomChamp()
    .then (champ) =>
      $scope.champ = champ.data


  $scope.reroll = ->
    ChampsService
      .getRandomChamp()
      .then (champ) =>
        $scope.champ = champ.data
