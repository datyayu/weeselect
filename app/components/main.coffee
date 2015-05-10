angular.module "weeselect", [
  "ui.router"
  "weeselect.routes"
  "weeselect.services.champsService"
  "weeselect.controllers.champList"
  "weeselect.controllers.champSelected"
]


.controller "MainCtrl", ($location, $scope) ->
  $scope.isActive = (path) ->
    currentPath = $location.path()
    # Home.
    if path is '/'
      if currentPath is '/'
        return "active"
    # Other than home.
    else if currentPath.substr(0, path.length) is path
      return "active"
    # Dunno.
    else
      return  ""
