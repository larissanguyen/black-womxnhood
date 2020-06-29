class CreateJoinTableResourcesTopics < ActiveRecord::Migration[6.0]
  def change
    create_join_table :resources, :topics do |t|
      t.index [:resource_id, :topic_id]
      t.index [:topic_id, :resource_id]
    end
  end
end
