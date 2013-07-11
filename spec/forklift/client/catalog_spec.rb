# -*- encoding : utf-8 -*-
require 'helper'

describe Forklift::Client::Catalog do

  before :each do
    @client = Forklift.new(api_key: ENV["API_KEY"], shared_secret: ENV["SHARED_SECRET"])
  end

  describe ".new", :vcr do
    it "is a Forklift::Client::Catalog" do
      catalog = Forklift::Client::Catalog.new(
        @client, 
        {"no"=>"26", "level_no"=>"1", "name"=>"運動、戶外、票券", "type"=>"區"})

      expect(catalog).to be_a Forklift::Client::Catalog
    end

    it "has no, level_no, name, type" do
      catalog = Forklift::Client::Catalog.new(
        @client, 
        {"no"=>"26", "level_no"=>"1", "name"=>"運動、戶外、票券", "type"=>"區"})
      expect(catalog.no).to eq("26")
      expect(catalog.level_no).to eq("1")
      expect(catalog.name).to eq("運動、戶外、票券")
      expect(catalog.type).to eq("區")
    end
  end

  describe ".going_down", :vcr do
    it "return a hash" do
      catalog = Forklift::Client::Catalog.new(
        @client, 
        {"no"=>"26", "level_no"=>"1", "name"=>"運動、戶外、票券", "type"=>"區"})
      expect(catalog.going_down).to be_a Hash
    end

    it "has key :count" do
      catalog = Forklift::Client::Catalog.new(
        @client, 
        {"no"=>"26", "level_no"=>"1", "name"=>"運動、戶外、票券", "type"=>"區"})
      expect(catalog.going_down.has_key?(:count)).to eq(true)
    end

    it "has key :catalogs" do
      catalog = Forklift::Client::Catalog.new(
        @client, 
        {"no"=>"26", "level_no"=>"1", "name"=>"運動、戶外、票券", "type"=>"區"})
      expect(catalog.going_down.has_key?(:catalogs)).to eq(true)
    end

    it "has catalog in :catalogs" do
      catalog = Forklift::Client::Catalog.new(
        @client, 
        {"no"=>"26", "level_no"=>"1", "name"=>"運動、戶外、票券", "type"=>"區"})
      expect(catalog.going_down[:catalogs].first).to be_a Forklift::Client::Catalog
    end
  end

  describe ".unboxing", :vcr do
    it "return a hash" do
      catalog = Forklift::Client::Catalog.new(
        @client, 
        {"no"=>"26", "level_no"=>"1", "name"=>"運動、戶外、票券", "type"=>"區"})
      expect(catalog.unboxing).to be_a Hash
    end

    it "has key :count" do
      catalog = Forklift::Client::Catalog.new(
        @client, 
        {"no"=>"26", "level_no"=>"1", "name"=>"運動、戶外、票券", "type"=>"區"})
      expect(catalog.unboxing.has_key?(:count)).to eq(true)
    end

    it "has key :gd" do
      catalog = Forklift::Client::Catalog.new(
        @client, 
        {"no"=>"26", "level_no"=>"1", "name"=>"運動、戶外、票券", "type"=>"區"})
      expect(catalog.unboxing.has_key?(:gds)).to eq(true)
    end

    it "has gd in :catalogs" do
      catalog = Forklift::Client::Catalog.new(
        @client, 
        {"no"=>"26", "level_no"=>"1", "name"=>"運動、戶外、票券", "type"=>"區"})
      expect(catalog.unboxing[:gds].first).to be_a Forklift::Client::Gd
    end
  end
end
