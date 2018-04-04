require 'rails_helper'

RSpec.describe "clubs/index", type: :view do
  before(:each) do
    assign(:clubs, [
      Club.create!(
        :club_name => "Club Name",
        :university_name => "University Name",
        :club_link => "Club Link",
        :description => "MyText",
        :photo_link => "Photo Link",
        :verified => false
      ),
      Club.create!(
        :club_name => "Club Name",
        :university_name => "University Name",
        :club_link => "Club Link",
        :description => "MyText",
        :photo_link => "Photo Link",
        :verified => false
      )
    ])
  end

  it "renders a list of clubs" do
    render
    assert_select "tr>td", :text => "Club Name".to_s, :count => 2
    assert_select "tr>td", :text => "University Name".to_s, :count => 2
    assert_select "tr>td", :text => "Club Link".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Photo Link".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
