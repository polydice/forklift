# -*- encoding : utf-8 -*-
require 'helper'

describe Forklift::Client::Sections do

  before :each do
    @client = Forklift.new(api_key: ENV["API_KEY"], shared_secret: ENV["SHARED_SECRET"])
    @sections = @client.sections
  end

  describe ".sections", :vcr do
    it "return a hash" do
      expect(@sections).to be_a Hash
    end

    it "has count" do
      expect(@sections.has_key?("count")).to eq(true)
    end

    it "has category" do
      expect(@sections.has_key?("category")).to eq(true)
    end

    it "has child as level_no=1" do
      expect(@sections["category"].first["level_no"]).to eq("1")
    end
  end
end
