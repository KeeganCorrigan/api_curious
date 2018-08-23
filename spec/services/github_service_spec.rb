
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
        VCR.use_cassette("github_service_following") do

          user = create(:user)
          ghs = GithubService.new(user)
          following = ghs.following.first

          expect(ghs.following.count).to eq(2)
          expect(following).to have_key(:login)
          expect(following).to have_key(:id)
          expect(following).to have_key(:avatar_url)
        end
      end
    end

    describe "#starred" do
      it "returns all starred repos" do
        VCR.use_cassette("github_service_starred") do

          user = create(:user)
          ghs = GithubService.new(user)
          starred = ghs.starred

          expect(starred.count).to eq(1)
        end
      end
    end

    describe "#repos" do
      it "returns all user repos" do
        VCR.use_cassette("github_service_repos") do

          user = create(:user)
          ghs = GithubService.new(user)
          repos = ghs.repos
          repo = repos.first

          expect(repos.count).to eq(30)
          expect(repo).to have_key(:name)
          expect(repo).to have_key(:language)
          expect(repo).to have_key(:stargazers_count)
        end
      end
    end

    describe "#organizations" do
      it "returns all organizations" do
        VCR.use_cassette("github_service_organizations") do

          user = create(:user)
          ghs = GithubService.new(user)
          orgs = ghs.organizations

          expect(orgs.count).to eq(0)
        end
      end
    end

    describe "#recent_commits" do
      it "returns all commits by user in last week" do
        VCR.use_cassette("github_service_recent_commits") do

          user = create(:user)
          ghs = GithubService.new(user)
          commits = ghs.recent_commits
          commit = commits[:items].first

          expect(commit[:commit]).to have_key(:url)
          expect(commit[:commit][:author]).to have_key(:date)
          expect(commit[:commit][:author]).to have_key(:name)
          expect(commit[:commit]).to have_key(:message)
        end
      end
    end
  end
end
