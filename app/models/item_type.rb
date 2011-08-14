class ItemType < ActiveRecord::Base
  has_one :item, :dependent => :destroy
end
