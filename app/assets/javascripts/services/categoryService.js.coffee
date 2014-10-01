app = angular.module 'categoryService', []

app.factory 'categoryService' , ['$http', '$q', ($http, $q) ->
		getAll: (data) ->
			deferred = $q.defer()
			$http { url: './categories', method: 'GET', data: data}
			.success ( (data) ->
				deferred.resolve(data)
				return
			)
			.error ( (data, status, header, config) ->
				deferred.reject {
					data:data, 
					status: status,
					headers: header, 
					config: config
				}
				return
			)
			deferred.promise
	] 

