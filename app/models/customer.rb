class Customer < ActiveRecord::Base
  # validations
  validates :name, :presence => true
  validates :person_in_charge_name, :presence => true
  validates :person_in_charge_position, :presence => true
  validates :email, :presence => true, :email => true
  validates :address, :presence => true
end
