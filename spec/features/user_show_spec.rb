require "rails_helper"

describe "a user logs in" do
  describe "they click on followers" do
    it "goes to a page that displays followers" do
      user = create(:user)

      json_response = File.open("./fixtures/followers.json")
      stub_request(:get, "https://api.github.com/users/keegancorrigan/followers").to_return(status: 200, body: json_response)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content("Followers")

      click_on "Followers"

      expect(current_path).to eq(user_followers_path(user))
    end
  end
end
