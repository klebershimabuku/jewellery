class AddQuantityToItemParts < ActiveRecord::Migration
  def self.up
    add_column :item_parts, :quantity, :integer
  end

  def self.down
    remove_column :item_parts, :quantity
  end
end
