# -*- encoding: utf-8 -*-
require 'helper'

describe Forklift do
  #after do
  #  Forklift.reset
  #end

  describe ".respond_to?" do
    it "is true if method exists" do
      expect(Forklift.respond_to?(:new, true)).to eq(true)
    end
  end

  describe ".new" do
    it "is a Forklift::Client" do
      expect(Forklift.new).to be_a Forklift::Client
    end
  end
end
