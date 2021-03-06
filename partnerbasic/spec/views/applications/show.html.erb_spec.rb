require 'rails_helper'

RSpec.describe "applications/show", type: :view do
  before(:each) do
    @application = assign(:application, Application.create!(
      :text => "MyText",
      :group => nil,
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
