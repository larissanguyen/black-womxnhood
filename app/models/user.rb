class User < ApplicationRecord
	has_many :comments
	has_many :upvotes
	has_many :resources, through: :comments, as: :commented_resources
	has_many :resources, through: :upvotes, as: :upvoted_resources
end
