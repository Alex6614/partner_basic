require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      :club => nil,
      :company => nil,
      :review_text => "MyText"
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input[name=?]", "review[club_id]"

      assert_select "input[name=?]", "review[company_id]"

      assert_select "textarea[name=?]", "review[review_text]"
    end
  end
end
