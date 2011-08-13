class ItemPart < ActiveRecord::Base
  belongs_to :item
  belongs_to :part
    
  attr_accessor :autocomplete_part_id
end
