require 'rails_helper'

RSpec.describe "clubs/show", type: :view do
  before(:each) do
    @club = assign(:club, Club.create!(
      :club_name => "Club Name",
      :university_name => "University Name",
      :club_link => "Club Link",
      :description => "MyText",
      :photo_link => "Photo Link",
      :verified => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Club Name/)
    expect(rendered).to match(/University Name/)
    expect(rendered).to match(/Club Link/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Photo Link/)
    expect(rendered).to match(/false/)
  end
end
