require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :email => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :password_hash => "MyString",
      :photo_link => "MyString"
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

      assert_select "input[name=?]", "student[email]"

      assert_select "input[name=?]", "student[first_name]"

      assert_select "input[name=?]", "student[last_name]"

      assert_select "input[name=?]", "student[password_hash]"

      assert_select "input[name=?]", "student[photo_link]"
    end
  end
end
