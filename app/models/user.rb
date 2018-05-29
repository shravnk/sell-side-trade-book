class User < ApplicationRecord
	has_secure_password
	
	validates_presence_of :name, :username, :user_type
	validates :username, uniqueness: true

	def self.find_or_create_by_omniauth(auth_hash)
	  username = auth_hash['info']['username']
      	where(:username => username).first_or_create do |user|
	        user.name = auth_hash['info']['name']
	        user.uid = auth_hash['uid']
	  	end
	end


end