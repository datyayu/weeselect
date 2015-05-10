angular
.module "weeselect.controllers.champSelected", []

.controller "ChampSelectedCtrl", ($scope, ChampsService) ->
  $scope.champ = null
  allChamps = no

  ChampsService.getChamps().then (champs) =>
    allChamps = yes if champs.length is 0

    ChampsService
      .getLocalChampList()
      .then (champList) =>
        ChampsService.setChamps champList
        console.log champList
        ChampsService
          .getRandomChamp()
          .then (champ) =>
            $scope.champ = champ.data


  $scope.reroll = ->
    ChampsService
      .getRandomChamp()
      .then (champ) =>
        $scope.champ = champ.data
