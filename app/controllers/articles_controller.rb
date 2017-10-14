class ArticlesController < ApplicationController
	skip_before_filter :verify_authenticity_token
	# before_filter :check_access
	def index
		unless params[:tb_url].blank?
			@page = MetaInspector.new(params[:tb_url])
		end
	end

	def create
		if params[:article][:action].to_s == 'save'
			@article = Article.new(article_params)
			@article.user_id = session[:user_id]
			@article.published = false
			if @article.save
				arr_tag = []
				tags = params[:tags].to_s.split(',')

				for i in 0..tags.count - 1
					arr_tag << { article_id: @article.id, tag: tags[i].to_s.strip }
				end

				@articleTag = ArticleTag.create!([arr_tag])
				if @articleTag
					redirect_to '/articles/' + @article.id.to_s
				end
			end
		else
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	private
		def article_params
			params.require(:article).permit(:user_id, :article_url, :image_url, :title, :synopsis, :article_category_id, :article_platform_id)
		end
end
