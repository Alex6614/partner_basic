require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      :company_name => "MyString",
      :description => "MyText",
      :company_link => "MyString",
      :photo_link => "MyString"
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input[name=?]", "company[company_name]"

      assert_select "textarea[name=?]", "company[description]"

      assert_select "input[name=?]", "company[company_link]"

      assert_select "input[name=?]", "company[photo_link]"
    end
  end
end
