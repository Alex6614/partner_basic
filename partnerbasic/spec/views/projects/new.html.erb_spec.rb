require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      :company => nil,
      :project_name => "MyString",
      :description => "MyText",
      :group => nil
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input[name=?]", "project[company_id]"

      assert_select "input[name=?]", "project[project_name]"

      assert_select "textarea[name=?]", "project[description]"

      assert_select "input[name=?]", "project[group_id]"
    end
  end
end
