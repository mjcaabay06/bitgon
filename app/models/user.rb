class User < ActiveRecord::Base
  belongs_to :user_role
  belongs_to :status

  def self.validate_login(email_address, password)
  	user = User.find_by_email_address(email_address)
  	if user && user.password == Digest::MD5.hexdigest(password) && user.status_id == 1
  		user
  	else
  		nil
  	end
  end
end
