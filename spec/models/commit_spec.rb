require "rails_helper"

describe Commit, type: :model do
  it "has attributes" do
    data = {
              commit:
                {
                  url: "iojasdoij",
                  author:
                    {
                      date: "12-28-16",
                      name: "BillBrasky"
                    },
                  message: "pijasd09j09jasndaoasdoijad"
                }
            }

    commit = Commit.new(data)

    expect(commit.url).to eq(data[:commit][:url])
    expect(commit.date).to eq(data[:commit][:author][:date])
    expect(commit.name).to eq(data[:commit][:author][:name])
    expect(commit.message).to eq(data[:commit][:message])
  end
end
