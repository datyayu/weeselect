angular.module "boom", [
  "ui.router"
]


.config ($locationProvider, $urlRouterProvider, $stateProvider) ->
  $locationProvider.html5Mode yes

  $stateProvider
    # Home page
    .state "main",
      url: "/"
      templateUrl: "/app/assets/html/home.html"
    #Development commit log
    .state "log",
      url: "/log"
      templateUrl: "/app/assets/html/log.html"
    # Main champ generator
    .state "random",
      url: "/random"
      templateUrl: "/app/assets/html/champList.html"
