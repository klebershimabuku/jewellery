require 'spec_helper'

describe "item_types/new.html.erb" do
  before(:each) do
    assign(:item_type, stub_model(ItemType,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new item_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => item_types_path, :method => "post" do
      assert_select "input#item_type_title", :name => "item_type[title]"
    end
  end
end
