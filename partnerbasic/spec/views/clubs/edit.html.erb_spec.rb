require 'rails_helper'

RSpec.describe "clubs/edit", type: :view do
  before(:each) do
    @club = assign(:club, Club.create!(
      :club_name => "MyString",
      :university_name => "MyString",
      :club_link => "MyString",
      :description => "MyText",
      :photo_link => "MyString",
      :verified => false
    ))
  end

  it "renders the edit club form" do
    render

    assert_select "form[action=?][method=?]", club_path(@club), "post" do

      assert_select "input[name=?]", "club[club_name]"

      assert_select "input[name=?]", "club[university_name]"

      assert_select "input[name=?]", "club[club_link]"

      assert_select "textarea[name=?]", "club[description]"

      assert_select "input[name=?]", "club[photo_link]"

      assert_select "input[name=?]", "club[verified]"
    end
  end
end
