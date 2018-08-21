require "rails_helper"

describe "a user logs in" do
  describe "they click on followers" do
    it "goes to a page that displays followers" do
      user = User.create!(username: "iaijs", avatar_url: "https://en.wikipedia.org/wiki/Dog#/media/File:Collage_of_Nine_Dogs.jpg", email: "j09joi", uid: 1, provider: "github", oauth_token: "90jioda")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content("Followers")

      click_on "Followers"

      expect(current_path).to eq(user_followers_path(user))
    end
  end
end
