class Order < ActiveRecord::Base
  belongs_to :customer
  
  attr_accessor :autocomplete_customer_name
  
  #
  # nested resources association
  #
  has_many :item_orders
  has_many :items, :through => :item_orders
  accepts_nested_attributes_for :item_orders, :allow_destroy => true, :reject_if => lambda { |a| a['item_id'].blank? }
  
  #
  # validations
  #
  validates :autocomplete_customer_name, :presence => true
    
  def total_price
    self.item_orders.to_a.sum { |item| item.full_price }
  end

  def self.search(search)
    id = Customer.where("name LIKE ?", "%#{search}%")
    where("customer_id = ?", id)
  end
  
  
end
