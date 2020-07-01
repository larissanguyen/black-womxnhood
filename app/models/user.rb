class User < ApplicationRecord
	has_many :comments
	has_many :upvotes
	has_many :commented_resources, through: :comments, source: :resource
	has_many :upvoted_resources, through: :upvotes, source: :resource

	has_secure_password
end
