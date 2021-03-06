require 'rails_helper'

RSpec.describe "projects/edit", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :user => nil,
      :project_name => "MyString",
      :description => "MyText",
      :group => nil
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input[name=?]", "project[user_id]"

      assert_select "input[name=?]", "project[project_name]"

      assert_select "textarea[name=?]", "project[description]"

      assert_select "input[name=?]", "project[group_id]"
    end
  end
end
