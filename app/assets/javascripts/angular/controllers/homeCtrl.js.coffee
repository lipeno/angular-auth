# app/assets/javascripts/angular/controllers/HomeCtrl.js.coffee

restaurantApp.controller 'HomeCtrl', ['$scope', '$http', ($scope, $http) ->
  # Notice how this controller body is empty
  $scope.restaurants = []
  $http.get('./restaurants.json').success((data) ->
    $scope.restaurants = data
  )
]