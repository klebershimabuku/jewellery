require 'spec_helper'

describe "item_types/index.html.erb" do
  before(:each) do
    assign(:item_types, [
      stub_model(ItemType,
        :title => "Title"
      ),
      stub_model(ItemType,
        :title => "Title"
      )
    ])
  end

  it "renders a list of item_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
