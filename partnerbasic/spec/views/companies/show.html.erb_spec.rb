require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :company_name => "Company Name",
      :description => "MyText",
      :company_link => "Company Link",
      :photo_link => "Photo Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Company Link/)
    expect(rendered).to match(/Photo Link/)
  end
end
