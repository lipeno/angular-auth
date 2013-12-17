restaurantApp.service "Session", ($location, $http, $q, $rootScope) ->
  @isAuthorized = ->
    if $("meta[name='current_user']")
      $rootScope.current_user = JSON.parse($("meta[name='current_user']").attr('content'))

    $rootScope.current_user? and $rootScope.current_user.id?

  @signin = (user) ->
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
        console.log "errors", data
        $location.path "/home"

  @requestCurrentUser = ->
    $http.get(
      "/current_user"
    )
    .success (data) ->
        currentUser = JSON.stringify(data)
    .error (data) ->
        console.log "errors", data