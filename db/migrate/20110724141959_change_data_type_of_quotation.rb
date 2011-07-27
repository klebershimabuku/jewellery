class ChangeDataTypeOfQuotation < ActiveRecord::Migration
  def self.up
    remove_column :part_types, :quotation
    add_column :part_types, :quotation, :decimal, :precision => 8, :scale => 2
  end

  def self.down
  end
end
