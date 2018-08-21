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
  end
end
