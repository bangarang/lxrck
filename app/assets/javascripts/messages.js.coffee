app = angular.module("Sender", ["ngResource"])

app.factory "Message", ["$resource", ($resource) ->
  $resource("/messages/:id", {id: "@id"}, {update: {method: "PUT"}})
]

@SendCtrl = ["$scope", "Message", ($scope, Message) ->
  $scope.messages = Message.query()
  
  $scope.isVisible = false

  $scope.isInvisible = true

  $scope.flipMessage = ->
  	$scope.isVisible = false
  	$scope.isInvisible = true

  $scope.addMessage = ->
    message = Message.save($scope.newMessage)
    $scope.messages.push(message)
    $scope.newMessage = {}
    $scope.isVisible = true
    $scope.isInvisible = false
]
