class User < ApplicationRecord
	has_many :comments
	has_many :upvotes
	has_many :commented_resources, through: :comments, source: :resource
	has_many :upvoted_resources, through: :upvotes, source: :resource

	has_secure_password
	
	def add_comment(resource, content)
		Comment.create(resource: resource, user: self, content: content)
	end
	
	def upvote(resource)
		Upvote.create(user: self, resource: resource)
	end
	
	# topics for which user has interacted with most resources
	def fav_topics(number= 5)
		sorted_topics_by_user_resources.take(number)
	end	
	
	# list of topics sorted by # of resources user has interacted with in that topic
	def sorted_topics_by_user_resources
		all_topics.sort_by{|topic| user_resources_with_topic(topic).count}
	end
	
	# list of resources a user has falling under partiuclar topic
	def user_resources_with_topic(topic)
		self.all_resources.select{|resource| resource.topics.include?(topic)}
	end
	
	def all_resources
		(commented_resources + upvoted_resources).uniq	
	end
	
	def all_topics
		all_resources.map(&:topics).flatten.uniq
	end
	
	
end
