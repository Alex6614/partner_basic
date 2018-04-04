require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        :company_name => "Company Name",
        :description => "MyText",
        :company_link => "Company Link",
        :photo_link => "Photo Link"
      ),
      Company.create!(
        :company_name => "Company Name",
        :description => "MyText",
        :company_link => "Company Link",
        :photo_link => "Photo Link"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Company Link".to_s, :count => 2
    assert_select "tr>td", :text => "Photo Link".to_s, :count => 2
  end
end
