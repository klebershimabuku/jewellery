class AddPhotoToItem < ActiveRecord::Migration
  def self.up
    add_column :items, :photo, :string
  end

  def self.down
    remove_column :items, :photo
  end
end
