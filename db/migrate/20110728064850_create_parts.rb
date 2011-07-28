class CreateParts < ActiveRecord::Migration
  def self.up
    create_table :parts do |t|
      t.string :title, :null => false
      t.decimal :set, :null => true
      t.decimal :price, :null => false
      t.integer :part_type_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :parts
  end
end
