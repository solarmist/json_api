class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :ent_type

      t.timestamps
    end
  end
end
