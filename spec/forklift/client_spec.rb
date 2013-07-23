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

    it "has :catalogs as key" do
      expect(@client.going_down(no: 1, level_no: 2).has_key?(:catalogs)).to eq(true)
    end

    it "going down next level_no" do
      expect(@client.going_down(no:1, level_no: 2)[:catalogs].first.level_no).to eq("3")
    end
  end

  describe ".unboxing", :vcr do
    it "return a hash" do
      expect(@client.unboxing(no: 1, level_no: 2)).to be_a Hash
    end

    it "has :gds as key" do
      expect(@client.unboxing(no: 1, level_no: 2).has_key?(:gds)).to eq(true)
    end

    it "really has goods" do
      expect(@client.unboxing(no:1, level_no: 2)[:gds].first).to be_a Forklift::Client::Gd
    end

    it "can pass Forklift::Client::Catalog" do
      site = @client.sites(no: 3)[:catalogs].first
      expect(@client.unboxing(catalog: site)[:gds].first).to be_a Forklift::Client::Gd
    end

    it "can pass page nad ps" do
      site = @client.sites(no: 3)[:catalogs].first
      expect(@client.unboxing(catalog: site, page: 3, ps: 10)[:gds].size).to eq(10)
    end
  end
end
