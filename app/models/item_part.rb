class ItemPart < ActiveRecord::Base
  belongs_to :item
  belongs_to :part
end
