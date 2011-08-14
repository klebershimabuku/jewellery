class Part < ActiveRecord::Base
  has_one :part_type
  before_validation :fix_set, :if => :set_changed?
  
  attr_accessor :price
  
  def price
    quotation = PartType.find(self.part_type_id).quotation
    price = self.weight * quotation
  end
  
  protected
    def fix_set
      if self[:set].nil?
        self[:set] = nil
      else
        self[:set] = set_before_type_cast.tr(' $, ' , '.' )
      end
    end  
        
end
