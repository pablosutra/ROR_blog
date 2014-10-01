
controllers = angular.module 'postCtrl', []

controllers.controller 'postCtrl', ['$scope', '$location', '$routeParams', 'postService',  ($scope, $location, $routeParams, postService) ->
	$scope.post = {
				title: ''
				content: ''
				category: ''
			}
	$scope.posts = []
	$scope.newCom = {
		author: '',
		commment: ''
	}
	$scope.comments = []
	if !angular.isUndefined($routeParams.category) && $routeParams.category != ''
		$scope.category = $routeParams.category
	if !angular.isUndefined($routeParams.id) && $routeParams.id != ''
		postService.getPost($routeParams.id).then ((data) ->
			$scope.post = data.post
			$scope.comments = data.comments
			return
		)	

	$scope.getPosts = (category) ->
		postService.getAll(category).then((data) ->
				$scope.posts = data
			)
		return
		
	$scope.clearForm = ->
		$scope.post = {}
		$scope.category = ''
		return
	$scope.createPost = ->
		$scope.post.category = $scope.category.id
		postService.savePost($scope.post).then((data) ->
				$location.path('/')
			)
		return	
	$scope.sendComment = ->
		postService.postComment($scope.newCom, $routeParams.id).then ((data) ->
			$scope.comments.push($scope.newCom)
			$scope.newCom = {}
		)
		return
	return
]