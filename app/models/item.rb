class Item < ActiveRecord::Base
  belongs_to :item_type
  has_many :item_parts
  has_many :parts, :through => :item_parts
end
