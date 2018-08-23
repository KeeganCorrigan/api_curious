require "rails_helper"

describe "user visits organizations index page" do
	it "should see organizations" do
		user = create(:user)

		json_response = File.open("./fixtures/github_organizations.json")
		stub_request(:get, "https://api.github.com/users/KeeganCorrigan/orgs").to_return(status: 200, body: json_response)

		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_organizations_path(user)

		expect(page).to have_css(".organizations", count: 1)

		within(first(".organizations")) do
			expect(page).to have_css(".login")
		end
	end
end
