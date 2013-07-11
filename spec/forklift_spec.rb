# -*- encoding : utf-8 -*-
require 'helper'

describe Forklift do
  describe ".new" do
    it "is a Forklift::Client" do
      expect(Forklift.new(api_key: :haha, shared_secret: :hahaha)).to be_a Forklift::Client
    end

    it "need api_key and shared_secret" do
      expect { Forklift.new }.to raise_error ArgumentError
    end

    it "has default options" do
      forklift = Forklift.new(api_key: :haha, shared_secret: :hahaha)
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
