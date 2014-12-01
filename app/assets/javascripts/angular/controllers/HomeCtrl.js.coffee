@episketch.controller 'HomeCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $http.get('http://episketch-api.local:3000/').success((data) ->
    $scope.home = data.description
    document.title = data.description
  )
]
