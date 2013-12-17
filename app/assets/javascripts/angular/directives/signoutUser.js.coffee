restaurantApp.directive 'signoutUser', ['$location', 'Session', ($location, Session) ->
  templateUrl: '../templates/users/signout.html'
  restrict: 'E'
  replace: true
  link: (scope, element, attrs) ->
    Session.requestCurrentUser().success (currentUserData) ->
      scope.currentUser = currentUserData.email
    scope.signout = ->
      Session.signout()
]