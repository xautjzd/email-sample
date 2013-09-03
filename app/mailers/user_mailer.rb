class UserMailer < ActionMailer::Base
  default from: "xautjzd@163.com"

	def welcome_email(user)
		@user = user
		@url = "https://github.com/login"
		mail(to: @user.email, subject: "Welcome to visit GitHub WebSite")
	end

	def activation(user)
		@user = user
		mail(to: @user.email, subject: "[xautjzd]Account Activation")
	end
end
