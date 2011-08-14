require 'spec_helper'

describe "items/edit.html.erb" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :title => "MyString",
      :price => "9.99",
      :labour_cost => "9.99",
      :item_type_id => 1
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => items_path(@item), :method => "post" do
      assert_select "input#item_title", :name => "item[title]"
      assert_select "input#item_price", :name => "item[price]"
      assert_select "input#item_labour_cost", :name => "item[labour_cost]"
      assert_select "input#item_item_type_id", :name => "item[item_type_id]"
    end
  end
end
