class Author < ApplicationRecord
	has_many :resources 
	
	def all_topics
		resource_topics_helper.flatten.uniq
	end
	
	def fav_topics
		# resources.group
		# resource_topics_helper.each do |resource_topics|
			
		# end
		
	end
	
	def topics_hash_helper
		all_topics.each_with_object({}) do |topic, hash|
			hash[topic.name] = author_resources_in_topic(topic)
		end
	end
	
	private
	
	def author_resources_in_topic(topic)
		topic.resources.where({author_id: self.id.to_s})
	end
	
	def resource_topics_helper
		resources.map(&:topics)
	end
end
