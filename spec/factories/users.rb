FactoryBot.define do
  factory :user do
    email "fake@gmail.com"
    uid 1
    provider "github"
    avatar_url "https://something.com/1.jpg"
    username "Keegan Corrigan"
    oauth_token ENV["GITHUB_TEST"]
    repos 48
    nickname "KeeganCorrigan"
  end
end
