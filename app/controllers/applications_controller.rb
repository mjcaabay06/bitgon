class ApplicationsController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def login
		data = params[:data]

		user = User.validate_login(data[:email_address], data[:password])

		unless user.blank?
			session[:user_id] = user.id
			render json: { status: true }
		else
			render json: { status: false }
		end
	end

	def register
		data = params[:data]
		userRoleId = 2
		statusId = 1

		@user = User.new(email_address: data[:email_address], password: Digest::MD5.hexdigest(data[:password]), user_role_id: userRoleId, status_id: statusId)

		if @user.save
			@userInfo = UserInfo.new(user_id: @user.id, first_name: data[:first_name], last_name: data[:last_name])
			
			if @userInfo.save
				render json: { status: true }
			else
				render json: { status: false, message: @userInfo.errors }
			end
		else
			render json: { status: false, message: @user.errors }
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end
end
