restaurantApp.service "Session", ($location, $http, $q, $rootScope) ->
  @isAuthorized = ->
    if $("meta[name='current_user']")
      $rootScope.current_user = JSON.parse($("meta[name='current_user']").attr('content'))

    $rootScope.current_user? and $rootScope.current_user.id?

  @login = (user) ->
    $http(
      method: "POST"
      url: "/signin"
      data: {user: {email: user.email, password: user.password}}
    )
    .success (data) ->
        $("meta[name='current_user']").attr('content', JSON.stringify(data))
        $location.path "/home"
    .error (data, status) ->

  @signout = ->
    $http(
      method: "DELETE"
      url: "/signout"
    )
    .success (data) ->
        $("meta[name='current_user']").attr('content', "null")
        $location.path "/auth"
    .error (data, status) ->

  @signup = (user) ->
    registerData = {user: {email: user.email, password: user.password, password_confirmation: user.confirm_password}}

    $http.post("/signup"
      registerData
    )
    .success (data) ->
        $("meta[name='current_user']").attr('content', JSON.stringify(data))
        $location.path "/"
    .error (data) ->
        console.log "errrors", data
        $location.path "/home"

#  # Redirect to the given url (defaults to '/')
#  redirect = (url) ->
#    url = url or "/"
#    $location.path url
#
#  service =
#    login: (email, password) ->
#      $http.post("/login",
#        user:
#          email: email
#          password: password
#      ).then (response) ->
#        service.currentUser = response.data.user
#        $rootScope.current_user = data.current_user
#        $("meta[name='current_user']").attr('content', JSON.stringify(data))
#        #$location.path(response.data.redirect);
#        $location.path "/record"  if service.isAuthenticated()
#
#
#    logout: (redirectTo) ->
#      $http.post("/logout").then ->
#        service.currentUser = null
#        $rootScope.current_user = null
#        $("meta[name='current_user']").attr('content', "null")
#
#        redirect redirectTo
#
#
#    register: (email, password, confirm_password) ->
#      $http.post("/users.json",
#        user:
#          email: email
#          password: password
#          password_confirmation: confirm_password
#      ).then (response) ->
#        service.currentUser = response.data
#        $rootScope.current_user = data
#        $("meta[name='current_user']").attr('content', JSON.stringify(data))
#
#        $location.path "/record"  if service.isAuthenticated()
#
#
#    requestCurrentUser: ->
#      if service.isAuthenticated()
#        $q.when service.currentUser
#      else
#        $http.get("/current_user").then (response) ->
#          service.currentUser = response.data.user
#          service.currentUser
#
#
#    currentUser: null