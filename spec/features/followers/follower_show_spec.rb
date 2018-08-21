require "rails_helper"

describe "user clicks on followers" do
	it "should see followers " do
    user = User.create!(username: "iaijs", avatar_url: "https://en.wikipedia.org/wiki/Dog#/media/File:Collage_of_Nine_Dogs.jpg", email: "j09joi", uid: 1, provider: "github", oauth_token: "90jioda")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_followers_path(user)

		expect(page).to have_content("3 results")

		expect(page).to have_css(".followers", count: 3)

		within(first(".follower")) do
			expect(page).to have_css(".username")
		end
	end
end
