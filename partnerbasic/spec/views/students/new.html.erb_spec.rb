require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      :email => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :password_hash => "MyString",
      :photo_link => "MyString"
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input[name=?]", "student[email]"

      assert_select "input[name=?]", "student[first_name]"

      assert_select "input[name=?]", "student[last_name]"

      assert_select "input[name=?]", "student[password_hash]"

      assert_select "input[name=?]", "student[photo_link]"
    end
  end
end
