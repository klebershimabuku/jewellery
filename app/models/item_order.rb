class ItemOrder < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  
  #
  # virtual attribute used for autocomplete field
  #
  attr_accessor :autocomplete_item_title
  
  def full_price
    quantity * self.item.price
  end
  
end
