require 'rails_helper'

describe "a user visits /" do
  describe "clicks on login" do
    it "visits the home page" do

      stub_omniauth

      json_response_1 = File.open("./fixtures/github_starred.json")
      stub_request(:get, "https://api.github.com/users/KeeganCorrigan/starred").to_return(status: 200, body: json_response_1)

      date = 1.week.ago.strftime("%Y-%m-%d")

      json_response_2 = File.open("./fixtures/github_recent_commits.json")
      stub_request(:get, "https://api.github.com/search/commits?q=committer-name:KeeganCorrigan+committer-date:>#{date}").to_return(status: 200, body: json_response_2)

      visit "/"

      click_on "Sign In with Github"

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Logout")

      click_on "Logout"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Sign In with Github")
    end
  end
end
