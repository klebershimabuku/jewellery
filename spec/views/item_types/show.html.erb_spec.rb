require 'spec_helper'

describe "item_types/show.html.erb" do
  before(:each) do
    @item_type = assign(:item_type, stub_model(ItemType,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
