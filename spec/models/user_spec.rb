require 'rails_helper'

RSpec.describe User, type: :model do
  describe "instance methods" do
    it "#nickname" do
      user = User.create!(username: "iaijs oihasoidj", avatar_url: "https://en.wikipedia.org/wiki/Dog#/media/File:Collage_of_Nine_Dogs.jpg", email: "j09joi", uid: 1, provider: "github", oauth_token: "90jioda")

      expect(user.nickname).to eq("iaijsoihasoidj")
    end
  end
end
