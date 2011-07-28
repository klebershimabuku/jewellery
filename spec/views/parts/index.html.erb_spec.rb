require 'spec_helper'

describe "parts/index.html.erb" do
  before(:each) do
    assign(:parts, [
      stub_model(Part,
        :title => "Title",
        :set => "9.99",
        :price => "9.99",
        :part_type_id => 1
      ),
      stub_model(Part,
        :title => "Title",
        :set => "9.99",
        :price => "9.99",
        :part_type_id => 1
      )
    ])
  end

  it "renders a list of parts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
