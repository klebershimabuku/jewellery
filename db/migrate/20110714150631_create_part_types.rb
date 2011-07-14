class CreatePartTypes < ActiveRecord::Migration
  def self.up
    create_table :part_types do |t|
      t.string :title
      t.float :quotation

      t.timestamps
    end
  end

  def self.down
    drop_table :part_types
  end
end
