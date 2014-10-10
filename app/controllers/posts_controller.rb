require 'koala'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
class PostsController < ApplicationController
	respond_to :json
	before_action :connectFacebook, only: :create
	def index
		if params.has_key?(:category)
			category = Category.where(category: params[:category])
			posts = Post.where(category: category)
		else
			posts = Post.all
		end
		respond_with(posts) do |format|
      		format.json { render :json => posts.as_json }
    	end
	end
	def create
		category = Category.find(params[:category])
		post = Post.create({title: params[:title], contents: params[:content], category: category})
		if post.valid? && post.save
			@graph.put_wall_post(post.title, :link => 'http://localhost:3030/post/'+post.id.to_s)
		else
			render 'public/442', :status => 442
			return
		end
		respond_with(post) do |format|
      		format.json { render :json => post.as_json }
    	end
	end
	def show
		post = Post.find(params[:id])
		respond_with do |format|
			format.json {render :json => {:post => post, :comments => post.comments}}
		end
	end
	def connectFacebook
		@oauth = Koala::Facebook::OAuth.new(346705832164625, 'cbbbc0818bdec5762dbe07bb18e5f7cd','http://localhost:3000/')
		@oauth.url_for_oauth_code(:permissions => "publish_stream, publish_actions", :display => 'touch')

		@graph = Koala::Facebook::GraphAPI.new('CAACEdEose0cBAGFrT0rcsnM2k8RbVtjtpwXrXJOQvlVJtgDRQXfYa7u51cwJYQglphGSWsWr3cWzZCQC2aw5SwtZCm7PZBG5gBXZAsZC8D0IOYCCrgF5KFtH1TOsJbIZAnsiQvqsmdb9JZC3TDppjkpBTAivgeJdpZCMRMY7kHZBvUFB2GIjxCN8N9OyxlH6egdD03p8e8PK1jZBZCE8eBs7ZCX5Mi50Fk1iPlYZD')
	end
end
