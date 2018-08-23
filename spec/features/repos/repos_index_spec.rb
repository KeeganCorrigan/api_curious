require "rails_helper"

describe "user visits following index page" do
	it "should see followers " do
		user = create(:user)

		json_response = File.open("./fixtures/github_repos.json")
		stub_request(:get, "https://api.github.com/users/KeeganCorrigan/repos").to_return(status: 200, body: json_response)

		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_repos_path(user)

		expect(page).to have_css(".repos", count: 1)

		within(first(".repos")) do
			expect(page).to have_css(".name")
		end
	end
end
