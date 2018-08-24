require "rails_helper"

describe "a user logs in" do
  describe "they click on followers" do
    it "goes to a page that displays followers" do
      user = create(:user)

      json_response_1 = File.open("./fixtures/github_starred.json")
      stub_request(:get, "https://api.github.com/users/KeeganCorrigan/starred").to_return(status: 200, body: json_response_1)

      date = 1.week.ago.strftime("%Y-%m-%d")

      json_response_2 = File.open("./fixtures/github_recent_commits.json")
      stub_request(:get, "https://api.github.com/search/commits?q=committer-name:KeeganCorrigan+committer-date:>#{date}").to_return(status: 200, body: json_response_2)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content("Followers")
      expect(page).to have_content("Following")
      expect(page).to have_content("Repos")

      expect(page).to have_content("Starred")

      expect(page).to have_css(".commit", count: 3)

      within(first(".commit")) do
        expect(page).to have_css(".message")
      end
    end
  end
end
