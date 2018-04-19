require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :email => "Email",
        :name => "Name",
        :password_hash => "Password Hash",
        :photo_link => "Photo Link",
        :description => "MyText",
        :is_student => false
      ),
      User.create!(
        :email => "Email",
        :name => "Name",
        :password_hash => "Password Hash",
        :photo_link => "Photo Link",
        :description => "MyText",
        :is_student => false
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Password Hash".to_s, :count => 2
    assert_select "tr>td", :text => "Photo Link".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
