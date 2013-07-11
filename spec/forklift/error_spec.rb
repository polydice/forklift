# -*- encoding : utf-8 -*-
require 'helper'

describe Forklift::Client do

  before :each do
    @client = Forklift.new(api_key: ENV["API_KEY"], shared_secret: ENV["SHARED_SECRET"])
  end

  after :each do
    # reset
    @client.api_key       = ENV["API_KEY"]
    @client.shared_secret = ENV["SHARED_SECRET"]
  end

  describe "given non valid key", :vcr do
    it "raise system error" do
      @client.api_key = "thisssssnonvalidkey"
      expect {@client.get_catalog(no:0, level_no:0)}.to raise_error Forklift::SystemError
    end
  end

  describe "given non valid secret", :vcr do
    it "raise signature error" do
      @client.shared_secret = "thisssssnonvalidshared_secerte"
      expect {@client.get_catalog(no:0, level_no:0)}.to raise_error Forklift::SignatureError
    end
  end

  describe "given non valid parameter", :vcr do
    it "raise parameter error" do
      expect {@client.get_catalog(no:0)}.to raise_error Forklift::ParameterError
    end
  end
end
