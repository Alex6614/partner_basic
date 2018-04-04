require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :email => "Email",
        :first_name => "First Name",
        :last_name => "Last Name",
        :password_hash => "Password Hash",
        :photo_link => "Photo Link"
      ),
      Student.create!(
        :email => "Email",
        :first_name => "First Name",
        :last_name => "Last Name",
        :password_hash => "Password Hash",
        :photo_link => "Photo Link"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Password Hash".to_s, :count => 2
    assert_select "tr>td", :text => "Photo Link".to_s, :count => 2
  end
end
