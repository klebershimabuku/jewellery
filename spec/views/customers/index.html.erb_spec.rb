require 'spec_helper'

describe "customers/index.html.erb" do
  before(:each) do
    assign(:customers, [
      stub_model(Customer,
        :name => "Name",
        :person_in_charge_name => "Person In Charge Name",
        :person_in_charge_position => "Person In Charge Position",
        :phone => "Phone",
        :fax => "Fax",
        :email => "Email",
        :address => "Address",
        :notes => "MyText"
      ),
      stub_model(Customer,
        :name => "Name",
        :person_in_charge_name => "Person In Charge Name",
        :person_in_charge_position => "Person In Charge Position",
        :phone => "Phone",
        :fax => "Fax",
        :email => "Email",
        :address => "Address",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of customers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Person In Charge Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Person In Charge Position".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
