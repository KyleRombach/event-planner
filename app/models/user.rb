class User < ActiveRecord::Base
	include BCrypt

	has_many :events, foreign_key: :creator_id
	has_and_belongs_to_many :attending, class_name: 'Event'

	validates :name, :email, :password, presence: true
	validates :email, uniqueness: true

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password


		def authenticate?(password)
			password == self.password_hash
		end
	end
end
