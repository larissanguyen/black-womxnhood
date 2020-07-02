class Topic < ApplicationRecord
	has_many :resources_topics
	has_many :resources, through: :resources_topics
	
	def top_resources(number= 5)
		resources_sorted_by_interactions.take(number)
	end
	
	def resources_sorted_by_interactions
		resources.sort_by{|r| r.interaction_count}
	end
	
	def resource_count
		resources.count
	end
end
