angular
.module "weeselect.controllers.champSelected", []

.controller "ChampSelectedCtrl", ($scope, ChampsService) ->
  $scope.champ = null
  champIDs = ChampsService.getLocalChamps()
  console.log champIDs

  ChampsService
    .getRandomChamp(champIDs)
    .then (champ) =>
      $scope.champ = champ


  $scope.reroll = ->
    ChampsService
      .getRandomChamp(champIDs)
      .then (champ) =>
        $scope.champ = champ
