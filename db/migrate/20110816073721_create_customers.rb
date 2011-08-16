class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.string :person_in_charge_name
      t.string :person_in_charge_position
      t.string :phone
      t.string :fax
      t.string :email
      t.string :address
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
