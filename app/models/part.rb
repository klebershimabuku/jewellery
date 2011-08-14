class Part < ActiveRecord::Base
  has_one :part_type
  has_many :item_parts
  has_many :items, :through => :item_parts
  accepts_nested_attributes_for :item_parts, :allow_destroy => true

  before_validation :fix_set, :if => :set_changed?
  
  attr_reader :price
  
  def price
    return @price if (@price)
    @price = PartType.find(self.part_type_id).quotation * self.weight
  end
  
  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
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
