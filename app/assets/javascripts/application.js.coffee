#= require jquery
#= require jquery_ujs
#= require angular
#= require angular-mocks
#= require application.js.coffee
#= require_tree .

# This is how we tell Angular about the existence of our application.
window.restaurantApp = angular.module('restaurantApp', [])

# This routing directive tells Angular about the default
# route for our application. The term "otherwise" here
# might seem somewhat awkward, but it will make more
# sense as we add more routes to our application.
restaurantApp.config(['$routeProvider', '$httpProvider', ($routeProvider, $httpProvider) ->
  $routeProvider
    .when('/home', {templateUrl: '../templates/home.html', controller: 'HomeCtrl'})
    .when('/auth', {templateUrl: '../templates/auth.html', controller: 'AuthCtrl'})
    .otherwise({templateUrl: '../templates/home.html',controller: 'HomeCtrl'})
])

restaurantApp.run(($rootScope, $location, Session) ->
  $rootScope.$on('$routeChangeStart', (event, next, current) ->
    if ($location.path() != '/auth' && !Session.isAuthorized())
      $location.path('/auth')
    else if ($location.path() == '/auth' && Session.isAuthorized())
      $location.path('/')
  )
)