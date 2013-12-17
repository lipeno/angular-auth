restaurantApp.directive 'signoutUser', ['$location', 'Session', ($location, Session) ->
  templateUrl: '../templates/users/signout.html'
  restrict: 'E'
  replace: true
  link: (scope, element, attrs) ->
    scope.signout = ->
      Session.signout()
]