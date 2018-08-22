require "rails_helper"

describe GithubPresenter, type: :model do
  context "instance methods" do
    describe "#followers" do
      it "returns github user objects based on number of followers" do
        VCR.use_cassette("github_presenter_followers") do

          user = create(:user)
          ghs = GithubPresenter.new(user)

          followers = ghs.followers
          follower = followers.first

          expect(followers.count).to eq(4)
          expect(follower).to be_a(GithubUser)
          expect(follower.username).to eq("NicholasJacques")
        end
      end
    end

    describe "#following" do
      it "returns github user objects based on users followed" do
        VCR.use_cassette("github_presenter_following") do

          user = create(:user)
          ghs = GithubPresenter.new(user)

          following = ghs.following
          follower = following.first

          expect(following.count).to eq(2)
          expect(follower).to be_a(GithubUser)
          expect(follower.username).to eq("NicholasJacques")
        end
      end
    end

    describe "#starred" do
      it "returns number of starred repos" do
        VCR.use_cassette("github_presenter_starred") do

          user = create(:user)
          ghs = GithubPresenter.new(user)

          star_count = ghs.starred

          expect(star_count).to eq(1)
        end
      end
    end

    describe "#repos" do
      it "returns repo objects for user" do
        VCR.use_cassette("github_presenter_repos") do

          user = create(:user)
          ghs = GithubPresenter.new(user)

          repos = ghs.repos
          repo = repos.first

          expect(repos.count).to eq(30)
          expect(repo).to be_a(Repo)
          expect(repo.name).to eq("1804_timed_assessment")
        end
      end
    end

    describe "#recent_commits" do
      it "returns recent commit objects for user" do
        VCR.use_cassette("github_presenter_recent_commits") do

          user = create(:user)
          ghs = GithubPresenter.new(user)

          commits = ghs.recent_commits
          commit = commits.first

          expect(commits.count).to eq(30)
          expect(commit).to be_a(Commit)
          expect(commit.name).to eq("KeeganCorrigan")
          expect(commit.message).to eq("add index view for followers, populates unstyled view avatar picture and name")
        end
      end
    end
  end
end
