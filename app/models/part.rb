class Part < ActiveRecord::Base
  has_one :part_type
  has_many :item_parts
  has_many :items, :through => :item_parts
  before_validation :fix_set, :if => :set_changed?
  before_validation :fix_price, :if => :price_changed?
  
  protected
    def fix_set
      if self[:set].nil?
        self[:set] = nil
      else
        self[:set] = set_before_type_cast.tr(' $, ' , '.' )
      end
    end  
    
    def fix_price
      self[:price] = price_before_type_cast.tr(' $, ' , '.' )
    end  
    
end
