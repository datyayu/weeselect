angular.module "weeselect", [
  "ui.router"
  "weeselect.routes"
  "weeselect.services.champsService"
  "weeselect.controllers.champList"
  "weeselect.controllers.champSelected"
]


.controller "MainCtrl", ($location, $scope) ->
  $scope.isActive = (path) ->
    currentPath = $location.path().substr(0, path.length)
    if currentPath == path
      return "active"
    else
      return  ""
