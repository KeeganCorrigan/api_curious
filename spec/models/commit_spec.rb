require "rails_helper"

describe Commit, type: :model do
  it "has attributes" do
    data = {
              commit:
                {
                  url: "iojasdoij",
                  author:
                    {
                      date: "2018-08-20T20:23:34.000-06:00",
                      name: "BillBrasky"
                    },
                  message: "pijasd09j09jasndaoasdoijad"
                },
              repository:
              {
                  name: "api_curious"
              }
            }

    commit = Commit.new(data)

    expect(commit.url).to eq(data[:commit][:url])
    expect(commit.date).to eq("2018-08-20")
    expect(commit.name).to eq(data[:commit][:author][:name])
    expect(commit.message).to eq(data[:commit][:message])
    expect(commit.repo_name).to eq(data[:repository][:name])
  end
end
