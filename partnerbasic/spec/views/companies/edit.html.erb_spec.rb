require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :company_name => "MyString",
      :description => "MyText",
      :company_link => "MyString",
      :photo_link => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

      assert_select "input[name=?]", "company[company_name]"

      assert_select "textarea[name=?]", "company[description]"

      assert_select "input[name=?]", "company[company_link]"

      assert_select "input[name=?]", "company[photo_link]"
    end
  end
end
