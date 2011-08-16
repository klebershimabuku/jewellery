require 'spec_helper'

describe "customers/show.html.erb" do
  before(:each) do
    @customer = assign(:customer, stub_model(Customer,
      :name => "Name",
      :person_in_charge_name => "Person In Charge Name",
      :person_in_charge_position => "Person In Charge Position",
      :phone => "Phone",
      :fax => "Fax",
      :email => "Email",
      :address => "Address",
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Person In Charge Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Person In Charge Position/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fax/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
