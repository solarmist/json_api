class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :entity_id
      t.string :tag

      t.timestamps
    end
  end
end
