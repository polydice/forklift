# -*- encoding : utf-8 -*-
require 'helper'

describe Forklift do
  describe ".respond_to?" do
    it "is true if method exists" do
      expect(Forklift.respond_to?(:new, true)).to eq(true)
    end
  end

  describe ".new" do
    it "is a Forklift::Client" do
      puts Forklift.new.api_key
      expect(Forklift.new).to be_a Forklift::Client
    end

    it "has default options" do
      forklift = Forklift.new
      expect(forklift.api_version).to eq('v1/')
    end

    it "take parameters in VALID_OPTIONS_KEYS" do
      forklift = Forklift.new(:api_key => :apikey, :shared_secret => :shared_secret, :non_valid => 'huha')
      expect(forklift.api_key).to eq(:apikey)
      expect(forklift.shared_secret).to eq(:shared_secret)
      expect {forklift.non_valid}.to(raise_error(NoMethodError))
    end
  end
end
