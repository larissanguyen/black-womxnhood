class Resource < ApplicationRecord
	belongs_to :author
	has_many :comments
	has_many :upvotes
	has_many :commenters, through: :comments, source: :user
	has_many :upvoters, through: :upvotes, source: :user
	
	# has_many :upvoted_resources, through: :upvotes, source: :resource
	has_many :resources_topics
	has_many :topics, through: :resources_topics
	
	def interaction_count
		interactions.count
	end
	
	def interactions
		comments + upvotes
	end
end
