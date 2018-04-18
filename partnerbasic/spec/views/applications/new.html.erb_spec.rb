require 'rails_helper'

RSpec.describe "applications/new", type: :view do
  before(:each) do
    assign(:application, Application.new(
      :text => "MyText",
      :group => nil,
      :project => nil
    ))
  end

  it "renders new application form" do
    render

    assert_select "form[action=?][method=?]", applications_path, "post" do

      assert_select "textarea[name=?]", "application[text]"

      assert_select "input[name=?]", "application[group_id]"

      assert_select "input[name=?]", "application[project_id]"
    end
  end
end
