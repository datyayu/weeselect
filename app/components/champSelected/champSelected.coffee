angular
.module "weeselect.controllers.champSelected", []

.controller "ChampSelectedCtrl", ($scope, ChampsService) ->
  $scope.champ

  ChampsService
    .getChamps()
    .then (pool) =>
      ChampsService
        .getRandomChampFrom pool
        .then (champ) =>
          $scope.champ = champ.data
          console.log(champ.data)
