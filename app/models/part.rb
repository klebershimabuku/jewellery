class Part < ActiveRecord::Base
  has_one :part_type
  has_many :item_parts
  has_many :items, :through => :item_parts
  accepts_nested_attributes_for :item_parts, :allow_destroy => true

  before_validation :fix_set, :if => :set_changed?
  attr_reader :price
  
  def price
    return @price if (@price)
    self.set = 0 if self.set.nil?
    @price = PartType.find(self.part_type_id).quotation * self.weight + self.set
  end
  
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
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
