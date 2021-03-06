require "rails_helper"

describe Repo, type: :model do
  it "should have attributes" do
    data = {
              name: "apicurious",
              language: "Ruby",
              stargazers_count: 1,
              html_url: "oijasd",
              created_at: "12-18-18"
            }

    repo = Repo.new(data)

    expect(repo.name).to eq("apicurious")
    expect(repo.language).to eq("Ruby")
    expect(repo.stargazers_count).to eq(1)
  end
end
