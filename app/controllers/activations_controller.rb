class ActivationsController < ApplicationController
	def activate
		@user = User.find_by(activation_token: params[:id])

		if @user.nil?
			redirect_to users_path
		else
			@user.update_attribute(:active, true)
			flash[:success] = "Your account is now activated."
			redirect_to root_path
		end
	end
end
