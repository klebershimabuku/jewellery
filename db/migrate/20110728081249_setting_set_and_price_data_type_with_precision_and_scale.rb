class SettingSetAndPriceDataTypeWithPrecisionAndScale < ActiveRecord::Migration
  def self.up
    remove_column :parts, :set
    remove_column :parts, :price
    add_column :parts, :set, :decimal, :precision => 8, :scale => 2
    add_column :parts, :price, :decimal, :precision => 8, :scale => 2
  end

  def self.down
  end
end
