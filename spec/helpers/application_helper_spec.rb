require 'rails_helper'

describe ApplicationModule do
  context "instance methods" do
    describe "#to_datetime" do
      it "transforms date from github to datetime format" do
        date = "2018-08-20T20:23:34.000-06:00"

        expect(to_datetime(date)).to eq("2018-08-20")
      end
    end
  end
end
