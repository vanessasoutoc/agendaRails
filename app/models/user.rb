class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	validates :email, uniqueness: true
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable


	def user_admin
		if admin == true
			user_admin = 'Sim'
			else
			user_admin = 'Não'
		end
	end

end
