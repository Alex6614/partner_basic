require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :email => "MyString",
      :name => "MyString",
      :password_hash => "MyString",
      :photo_link => "MyString",
      :description => "MyText",
      :is_student => false
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[password_hash]"

      assert_select "input[name=?]", "user[photo_link]"

      assert_select "textarea[name=?]", "user[description]"

      assert_select "input[name=?]", "user[is_student]"
    end
  end
end
