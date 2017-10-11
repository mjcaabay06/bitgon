class ArticlesController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :check_access
	def new
		unless params[:tb_url].blank?
			@page = MetaInspector.new(params[:tb_url]);
		end
	end

	def create
	end
end
