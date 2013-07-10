require 'helper'

describe Forklift::Client do

  before :each do
    @client = Forklift.new(api_key: ENV["API_KEY"], shared_secret: ENV["SHARED_SECRET"])
  end

  describe ".get_catelog", :vcr do
    it "return a hash" do
      expect(@client.get_catalog(no: 1, level_no: 2)).to be_a Hash
    end

    it "has a key - categories" do
      expect(@client.get_catalog(no: 1, level_no: 2).has_key?("categories")).to eq(true)
    end
  end
end
