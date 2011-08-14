class AddWeightToParts < ActiveRecord::Migration
  def self.up
    add_column :parts, :weight, :integer
  end

  def self.down
    remove_column :parts, :weight
  end
end
