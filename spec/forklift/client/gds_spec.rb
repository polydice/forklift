# -*- encoding : utf-8 -*-
require 'helper'

describe Forklift::Client::Gds do

  before :each do
    @client = Forklift.new(api_key: ENV["API_KEY"], shared_secret: ENV["SHARED_SECRET"])
    @gds = @client.gds({"no"=>"26", "level_no"=>"1", "name"=>"運動、戶外、票券", "type"=>"區"})
  end

  describe ".gds", :vcr do
    it "return a hash" do
      expect(@gds).to be_a Hash
    end

    it "has count" do
      expect(@gds.has_key?("count")).to eq(true)
    end

    it "has gd" do
      expect(@gds.has_key?("gd")).to eq(true)
    end

    it "has child hash with keys gd_id" do
      expect(@gds["gd"].first.has_key?("gd_id")).to eq(true)
    end
  end
end
