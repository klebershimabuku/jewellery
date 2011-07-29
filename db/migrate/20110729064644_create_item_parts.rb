class CreateItemParts < ActiveRecord::Migration
  def self.up
    create_table :item_parts do |t|
      t.references :item
      t.references :part

      t.timestamps
    end
  end

  def self.down
    drop_table :item_parts
  end
end
