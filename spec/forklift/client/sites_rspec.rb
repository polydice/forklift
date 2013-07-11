# -*- encoding : utf-8 -*-
require 'helper'

describe Forklift::Client do

  before :each do
    @client = Forklift.new(api_key: ENV["API_KEY"], shared_secret: ENV["SHARED_SECRET"])
    @section = @client.sections[:catalogs].first
  end

  describe ".sites", :vcr do
    it "can create from hash" do
      expect(@client.sites(no: @section.no)).to be_a Forklift::Client::Catalog
    end

    it "can create from Forklift::Client::Catalog" do
      expect(@client.sites(@section)).to be_a Forklift::Client::Catalog
    end
  end
end

