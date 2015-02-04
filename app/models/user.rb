class User < ActiveRecord::Base
	has_many :images, :as => :imageable
	
	has_many :recipes
	has_many :comments
	has_many :stories
	
	has_many :group_users
	has_many :groups, through: :group_users

	has_secure_password

	validates :email, presence: true, 
						uniqueness: true,
            format: { :with => /\w+@\w+\.\w+/}
	validates :username, presence: true,
            uniqueness: true
	validates :password,   presence: true,
           	length: { in: 6..20 }
end
