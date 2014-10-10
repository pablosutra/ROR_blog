class CategoriesController < ApplicationController
	respond_to :json
	def index
		categories = Category.all

		respond_with(categories) do |format|
      		format.json { render :json => categories }
    	end
	end
end
