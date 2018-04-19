require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "Email",
      :name => "Name",
      :password_hash => "Password Hash",
      :photo_link => "Photo Link",
      :description => "MyText",
      :is_student => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Password Hash/)
    expect(rendered).to match(/Photo Link/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
