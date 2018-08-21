require 'rails_helper'

describe "a user visits /" do
  it "clicks on login and fills out a form" do
    stub_omniauth

    visit "/"

    click_on "Sign In with Github"

    # TODO: redirect to dashboard path

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("sign out")
  end
end
