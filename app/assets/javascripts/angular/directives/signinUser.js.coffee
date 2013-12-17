restaurantApp.directive 'signinUser', ['$location', '$http', 'Session', ($location, $http, Session) ->
  templateUrl: '../templates/users/signin.html'
  restrict: 'E'
  replace: true
  link: (scope, element, attrs) ->
    scope.signin = (user) ->
      Session.signin(user)
]