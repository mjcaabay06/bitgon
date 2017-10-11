class ApplicationController < ActionController::Base
	layout 'application'
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_filter :check_login
	def index
	end

	def check_login
		unless session[:user_id].blank?
			@user = User.find(session[:user_id])
		end
	end

	def check_access
		if session[:user_id].blank?
			render layout: 'application', file: 'public/404.html'
		end
	end
end
