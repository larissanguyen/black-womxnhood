class CreateUpvotes < ActiveRecord::Migration[6.0]
  def change
    create_table :upvotes do |t|
      t.integer :user_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
