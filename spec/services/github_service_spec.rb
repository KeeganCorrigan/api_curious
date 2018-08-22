require 'rails_helper'

describe GithubService do
  context "instance methods" do
    describe "#followers" do
      it "finds all user followers" do
        VCR.use_cassette("github_service_followers") do

          user = create(:user)
          ghs = GithubService.new(user)
          follower = ghs.followers.first

          expect(ghs.followers.count).to eq(4)
          expect(follower).to have_key(:login)
          expect(follower).to have_key(:id)
          expect(follower).to have_key(:avatar_url)
        end
      end
    end

    describe "#following" do
      it "finds all users following" do


      end
    end

    describe "#starred" do
      it "returns all starred repos" do

      end
    end

    describe "#repos" do
      it "returns all user repos" do


      end
    end

    describe "#organizations" do
      it "returns all organizations" do


      end
    end

    describe "#recent_commits" do
      it "returns all commits by user in last week" do

      end
    end
  end
end
