restaurantApp.directive 'signupUser', ['$location', 'Session', ($location, Session) ->
  templateUrl: '../templates/users/signup.html'
  restrict: 'E'
  replace: true
  link: (scope, element, attrs) ->
    scope.signup = (user) ->
      Session.signup(user)
]