class CreateOrderizations < ActiveRecord::Migration
  def self.up
    create_table :item_orders do |t|
      t.references :item
      t.references :order
      t.integer :quantity
      t.timestamps
    end
  end

  def self.down
    drop_table :item_orders
  end
end
