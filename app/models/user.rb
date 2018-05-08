class User < ApplicationRecord
	has_secure_password
	
	validates :username, uniqueness: true

	def self.find_or_create_by_omniauth(auth_hash)
	  username = auth_hash['info']['username']
      	where(:username => username).first_or_create do |user|
	        user.password = auth_hash['info']['password']
	        user.name = auth_hash['info']['name']
	        user.user_type = auth_hash['info']['user_type']
	        user.uid = auth_hash['uid']
	  	end
	end
end