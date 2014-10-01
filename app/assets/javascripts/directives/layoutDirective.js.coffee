app = angular.module('layoutDirective', [])

app.directive('mainHeader', [ ->
		restrict: 'E', 
		replace: true, 
		scope: false,
		templateUrl: 'templates/directives/header.html'
	])

app.directive "dropCategory", [->
  restrict: "E"
  replace: true
  templateUrl: "templates/directives/dropCategory.html"
  link: (scope, elem, attrs) ->
    scope.categories = scope.getCategories()
    return
]
app.directive "aPost", [->
  restrict: "E"
  replace: true
  templateUrl: "templates/directives/post.html"
  link: (scope, elem, attrs) ->
    if !angular.isUndefined(attrs.category) && attrs.category !=''
     scope.categories = scope.getPosts(attrs.category)
    else
     scope.categories = scope.getPosts(attrs.category)

    return
]