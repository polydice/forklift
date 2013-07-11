# -*- encoding : utf-8 -*-
require 'helper'

describe Forklift::Client::Gd do

  before :each do
    @client = Forklift.new(api_key: ENV["API_KEY"], shared_secret: ENV["SHARED_SECRET"])
    @gd_hash = @client.unboxing({"no"=>"26", "level_no"=>"1", "name"=>"運動、戶外、票券", "type"=>"區"})["gd"].first
  end

  describe ".new", :vcr do
    it "is a Forklift::Client::Gd" do
      gd = Forklift::Client::Gd.new(@client, @gd_hash)
      expect(gd).to be_a Forklift::Client::Gd
    end
  end
end
