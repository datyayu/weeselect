angular.module "boom", [
  "ui.router",
]


.config ($urlRouterProvider, $stateProvider) ->

  $stateProvider
    .state "Main",
      url: ""
      views: {
        "menu": { templateUrl: "/app/assets/html/menu.html" }
        "main": { templateUrl: "/app/assets/html/log.html" }
      }
