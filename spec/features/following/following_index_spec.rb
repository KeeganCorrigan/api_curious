require "rails_helper"

describe "user visits following index page" do
	it "should see followers " do
		user = create(:user)

		json_response = File.open("./fixtures/github_following.json")
		stub_request(:get, "https://api.github.com/users/KeeganCorrigan/following").to_return(status: 200, body: json_response)

		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_following_path(user)

		expect(page).to have_css(".followers", count: 2)

		within(first(".followers")) do
			expect(page).to have_css(".username")
		end
	end
end
