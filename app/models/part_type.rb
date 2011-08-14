class PartType < ActiveRecord::Base
  belongs_to :parts
  before_validation :fix_quotation, :if => :quotation_changed?

  protected
    def fix_quotation
      self[:quotation] = quotation_before_type_cast.tr(' $, ' , '.' )
    end
end
