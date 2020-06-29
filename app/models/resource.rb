class Resource < ApplicationRecord
	belongs_to :author
	has_many :comments
	has_many :upvotes
	has_many :users, through: :comments, as: :commenters
	has_many :users, through: :upvotes, as: :upvoters
	has_many :resources_topics
	has_many :topics, through: :resources_topics
end
