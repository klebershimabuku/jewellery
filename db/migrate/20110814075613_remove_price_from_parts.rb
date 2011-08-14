class RemovePriceFromParts < ActiveRecord::Migration
  def self.up
    remove_column :parts, :price
  end

  def self.down
  end
end
