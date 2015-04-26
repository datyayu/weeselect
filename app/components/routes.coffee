angular.module "weeselect.routes", []

.config ($locationProvider, $stateProvider) ->
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

    # When the user rolled
    .state "pick",
      url: "/pick"
      templateUrl: "/app/assets/html/champSelected.html"
