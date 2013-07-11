# -*- encoding : utf-8 -*-
require 'helper'

describe Forklift::Client do

  before :each do
    @client = Forklift.new(api_key: ENV["API_KEY"], shared_secret: ENV["SHARED_SECRET"])
  end

  describe ".get_catelog", :vcr do
    it "return a hash" do
      expect(@client.get_catalog(no: 1, level_no: 2)).to be_a Hash
    end

    it "has categories as key" do
      expect(@client.get_catalog(no: 1, level_no: 2).has_key?("categories")).to eq(true)
    end
  end

  describe ".going_down", :vcr do
    it "return a hash" do
      expect(@client.going_down(no: 1, level_no: 2)).to be_a Hash
    end

    it "has category as key" do
      expect(@client.going_down(no: 1, level_no: 2).has_key?("category")).to eq(true)
    end

    it "going down next level_no" do
      expect(@client.going_down(no:1, level_no: 2)["category"].first["level_no"]).to eq("3")
    end
  end

  describe ".unboxing", :vcr do
    it "return a hash" do
      expect(@client.unboxing(no: 1, level_no: 2)).to be_a Hash
    end

    it "has gd as key" do
      expect(@client.unboxing(no: 1, level_no: 2).has_key?("gd")).to eq(true)
    end

    it "really has goods" do
      expect(@client.unboxing(no:1, level_no: 2)["gd"].first.has_key?("gd_id")).to eq(true)
    end
  end
end
