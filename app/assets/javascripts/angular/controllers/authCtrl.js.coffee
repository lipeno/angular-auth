# app/assets/javascripts/angular/controllers/HomeCtrl.js.coffee

restaurantApp.controller 'AuthCtrl', ['$scope', ($scope) ->
  # Created as an object so that its value can be manipulated through different scopes
  $scope.switcher = {
    value : "signin"
  }
]