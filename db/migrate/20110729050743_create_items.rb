class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :title
      t.decimal :price, :precision => 8, :scale => 2
      t.decimal :labour_cost, :precision => 8, :scale => 2
      t.integer :item_type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
