class Topic < ApplicationRecord
	has_many :resources_topics
	has_many :resources, through: :resources_topics
end
