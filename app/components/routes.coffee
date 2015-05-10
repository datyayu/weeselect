angular.module "weeselect.routes", []

.config ($locationProvider, $stateProvider) ->
  $locationProvider.html5Mode yes

  $stateProvider
    # Home page
    .state "main",
      url: "/"
      templateUrl: "/assets/html/home.html"

    #Development commit log
    .state "about",
      url: "/about"
      templateUrl: "/assets/html/about.html"

    # Main champ generator
    .state "random",
      url: "/random"
      controller: "ChampListCtrl"
      templateUrl: "/assets/html/champList.html"

    # When the user rolled
    .state "pick",
      url: "/pick"
      controller: "ChampSelectedCtrl"
      templateUrl: "/assets/html/champSelected.html"
