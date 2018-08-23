require 'rails_helper'

describe "a user visits /" do
  describe "clicks on login" do
    it "visits the home page" do
      stub_omniauth

      visit "/"

      click_on "Sign In with Github"

      # TODO: redirect to dashboard path

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Logout")
    end
  end

  describe "clicks on logout" do
    xit "goes back to root" do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      click_on "Logout"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Sign In with Github")
    end
  end
end
