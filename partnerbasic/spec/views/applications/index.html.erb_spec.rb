require 'rails_helper'

RSpec.describe "applications/index", type: :view do
  before(:each) do
    assign(:applications, [
      Application.create!(
        :text => "MyText",
        :group => nil,
        :project => nil
      ),
      Application.create!(
        :text => "MyText",
        :group => nil,
        :project => nil
      )
    ])
  end

  it "renders a list of applications" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
