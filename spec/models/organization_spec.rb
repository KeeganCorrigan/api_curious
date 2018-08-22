require "rails_helper"

describe Organization, type: :model do
  it "has attributes" do
    data = {
              login: "github",
              repos_url: "https://api.github.com/orgs/github/repos",
              uid: 9919,
              description: "How people build software"
            }

    org = Organization.new(data)

    expect(org.login).to eq(data[:login])
    expect(org.repos_url).to eq(data[:repos_url])
    expect(org.uid).to eq(data[:uid])
    expect(org.description).to eq(data[:description])
  end
end
