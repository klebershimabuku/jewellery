require 'spec_helper'

describe "customers/edit.html.erb" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :name => "MyString",
      :person_in_charge_name => "MyString",
      :person_in_charge_position => "MyString",
      :phone => "MyString",
      :fax => "MyString",
      :email => "MyString",
      :address => "MyString",
      :notes => "MyText"
    ))
  end

  it "renders the edit customer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => customers_path(@customer), :method => "post" do
      assert_select "input#customer_name", :name => "customer[name]"
      assert_select "input#customer_person_in_charge_name", :name => "customer[person_in_charge_name]"
      assert_select "input#customer_person_in_charge_position", :name => "customer[person_in_charge_position]"
      assert_select "input#customer_phone", :name => "customer[phone]"
      assert_select "input#customer_fax", :name => "customer[fax]"
      assert_select "input#customer_email", :name => "customer[email]"
      assert_select "input#customer_address", :name => "customer[address]"
      assert_select "textarea#customer_notes", :name => "customer[notes]"
    end
  end
end
