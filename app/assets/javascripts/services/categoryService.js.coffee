
app = angular.module 'categoryService', []

app.factory 'categoryService' , ['$http', '$q', ($http, $q) ->
			getAll: () ->
				self = this
				deferred = $q.defer()
				$http { url: './categorie', method: 'GET'}
				.success  (data) ->
					deferred.resolve(data)
					return
				
				.error (data, status, header, config) ->
						deferred.reject(self.handleError(data, status, header, config))
				deferred.promise
			handleError: (data, status, header, config) ->
					{
						data:data, 
						status: status,
						headers: header, 
						config: config
					}
] 

