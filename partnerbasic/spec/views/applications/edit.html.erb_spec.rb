require 'rails_helper'

RSpec.describe "applications/edit", type: :view do
  before(:each) do
    @application = assign(:application, Application.create!(
      :text => "MyText",
      :group => nil,
      :project => nil
    ))
  end

  it "renders the edit application form" do
    render

    assert_select "form[action=?][method=?]", application_path(@application), "post" do

      assert_select "textarea[name=?]", "application[text]"

      assert_select "input[name=?]", "application[group_id]"

      assert_select "input[name=?]", "application[project_id]"
    end
  end
end
