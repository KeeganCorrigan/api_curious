require "rails_helper"

describe "user clicks on followers" do
	it "should see followers " do
		user = create(:user)

		json_response = File.open("./fixtures/github_followers.json")
		stub_request(:get, "https://api.github.com/users/KeeganCorrigan/followers").to_return(status: 200, body: json_response)

		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_followers_path(user)

		expect(page).to have_css(".followers", count: 4)

		within(first(".followers")) do
			expect(page).to have_css(".username")
		end
	end
end
