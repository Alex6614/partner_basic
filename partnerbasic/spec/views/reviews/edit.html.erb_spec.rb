require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  before(:each) do
    @review = assign(:review, Review.create!(
      :club => nil,
      :company => nil,
      :review_text => "MyText"
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do

      assert_select "input[name=?]", "review[club_id]"

      assert_select "input[name=?]", "review[company_id]"

      assert_select "textarea[name=?]", "review[review_text]"
    end
  end
end
