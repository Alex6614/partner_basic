require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  before(:each) do
    assign(:groups, [
      Group.create!(
        :club => nil,
        :group_name => "Group Name"
      ),
      Group.create!(
        :club => nil,
        :group_name => "Group Name"
      )
    ])
  end

  it "renders a list of groups" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Group Name".to_s, :count => 2
  end
end
