class SubmitLinkController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		unless params[:tb_url].blank?
			@page = MetaInspector.new(params[:tb_url]);
		end
	end
end
