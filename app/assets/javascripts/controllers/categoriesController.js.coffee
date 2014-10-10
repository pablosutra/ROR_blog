controllers = angular.module 'categoryCtrl', []

controllers.controller 'categoryCtrl', ['$scope', 'categoryService', ($scope, categoryService) ->
	$scope.categories = []
	$scope.getCategories = ->
		categoryService.getAll().then( (data) ->
			$scope.categories = data
			return
		, 
		(status)-> 
			console.log(status)
		)
		return
	return
]