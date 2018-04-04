require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :company => nil,
      :project_name => "Project Name",
      :description => "MyText",
      :group => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Project Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
