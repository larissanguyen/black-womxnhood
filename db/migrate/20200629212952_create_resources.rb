class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :title
      t.integer :author_id
      t.datetime :date_published

      t.timestamps
    end
  end
end
