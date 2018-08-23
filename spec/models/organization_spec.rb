require "rails_helper"

describe Organization, type: :model do
  it "has attributes" do
    data = {
              login: "github",
              avatar_url: "https://api.github.com/orgs/github.jpg",
              id: 9919,
              description: "How people build software"
            }

    org = Organization.new(data)

    expect(org.login).to eq(data[:login])
    expect(org.avatar_url).to eq(data[:avatar_url])
    expect(org.id).to eq(data[:id])
    expect(org.description).to eq(data[:description])
  end
end
