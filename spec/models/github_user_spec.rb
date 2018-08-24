require "rails_helper"

describe GithubUser, type: :model do
  describe "instance methods" do
    it "should have attributes" do
      data = {
                login: "oijasd",
                avatar_url: "poij09jasd",
                uid: "08asd09u"
              }

      ghu = GithubUser.new(data)

      expect(ghu.username).to eq(data[:login])
      expect(ghu.avatar_url).to eq(data[:avatar_url])
      expect(ghu.uid).to eq(data[:uid])
    end

    describe "#recent_commits" do
      it "returns recent commits for follower" do
        VCR.use_cassette("github_follower_recent_commits") do
          user = create(:user)

          data = {
                    login: "KeeganCorrigan",
                    avatar_url: "poij09jasd",
                    uid: "08asd09u"
                  }

          ghu = GithubUser.new(data, user)

          recent_commits = ghu.commits

          expect(recent_commits.count).to eq(22)
          expect(recent_commits.first).to be_a(Commit)
        end
      end
    end
  end
end
