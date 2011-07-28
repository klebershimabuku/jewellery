require 'spec_helper'

describe "parts/new.html.erb" do
  before(:each) do
    assign(:part, stub_model(Part,
      :title => "MyString",
      :set => "9.99",
      :price => "9.99",
      :part_type_id => 1
    ).as_new_record)
  end

  it "renders new part form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => parts_path, :method => "post" do
      assert_select "input#part_title", :name => "part[title]"
      assert_select "input#part_set", :name => "part[set]"
      assert_select "input#part_price", :name => "part[price]"
      assert_select "input#part_part_type_id", :name => "part[part_type_id]"
    end
  end
end
