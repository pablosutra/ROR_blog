app = angular.module 'postService', []

app.factory 'postService' , ['$http', '$q', ($http, $q) ->
	getAll: (data) ->
			deferred = $q.defer()
			url= './posts'
			if !angular.isUndefined(data) && data != '' 
				url+= '?category='+data
			$http { url: url, method: 'GET'}
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
	getPost: (id) ->
		deferred = $q.defer()
		$http {url: './posts/'+id, method:'GET' }
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
	postComment: (comment, id) ->
			deferred = $q.defer()
			data = {
				comment: comment.comment,
				author: comment.author,
				postId: id
			}
			$http { url: './comments', method:'POST', data:  data}
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
			
	savePost: (data) ->
		deferred = $q.defer()
		$http { url: './posts', method: 'POST', data: data}
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

