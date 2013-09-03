class User < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }

	def send_activation
		# generate_token(:activation_token)
		UserMailer.activation(self).deliver
	end

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(activation_token: self[column])
	end
end
