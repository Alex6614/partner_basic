require 'rails_helper'

RSpec.describe "students/show", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :email => "Email",
      :first_name => "First Name",
      :last_name => "Last Name",
      :password_hash => "Password Hash",
      :photo_link => "Photo Link"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Password Hash/)
    expect(rendered).to match(/Photo Link/)
  end
end
