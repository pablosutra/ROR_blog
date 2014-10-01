
app = angular.module 'blog', [ 'ngRoute', 'layoutDirective', 'categoryCtrl', 'postCtrl', 'categoryService', 'postService']


app.config ['$routeProvider', ($routeProvider) ->
		$routeProvider.when('/',{
			   templateUrl: './templates/main.html'
			})
		$routeProvider.when('/newPost', {
			templateUrl: './templates/newPost.html'
			})
		$routeProvider.when('/browse/:category',{
			templateUrl: 'templates/browseCategory.html'
			})
		$routeProvider.when('/post/:id', {
			 templateUrl: 'templates/postDetail.html'
			})
		$routeProvider.otherwise({redirectTo: '/'})
]
app.config(["$httpProvider", (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])