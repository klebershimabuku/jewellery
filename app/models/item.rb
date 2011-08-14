class Item < ActiveRecord::Base
  belongs_to :item_type
  has_many :item_parts, :dependent => :destroy
  has_many :parts, :through => :item_parts
  accepts_nested_attributes_for :item_parts, :allow_destroy => true, :reject_if => lambda { |a| a['part_id'].blank? }
  after_save :save_id
  validates :title, :presence => true
  
  before_validation :fix_labour_cost, :if => :labour_cost_changed?
  
  mount_uploader :photo, PhotoUploader
  
  def save_id
    item_part_attributes = [ { :item_id => self.id } ]
  end
  
  protected
  
  def fix_labour_cost
    self[:labour_cost] = labour_cost_before_type_cast.tr(' $, ' , '.' )
  end
  
end
