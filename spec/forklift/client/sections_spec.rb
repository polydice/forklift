# -*- encoding : utf-8 -*-
require 'helper'

describe Forklift::Client do

  before :each do
    @client = Forklift.new(api_key: ENV["API_KEY"], shared_secret: ENV["SHARED_SECRET"])
    @sections = @client.sections
  end

  describe ".sections", :vcr do
    it "return a hash" do
      expect(@sections).to be_a Hash
    end

    it "has :count" do
      expect(@sections.has_key?(:count)).to eq(true)
    end

    it "has :catalogs" do
      expect(@sections.has_key?(:catalogs)).to eq(true)
    end

    it "has child as Forklift::Client::Catalog" do
      expect(@sections[:catalogs].first).to be_a Forklift::Client::Catalog
    end
  end
end
