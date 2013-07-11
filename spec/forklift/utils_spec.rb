# -*- encoding : utf-8 -*-
require 'helper'

describe Forklift::Utils do

  before :each do
    @client = Forklift.new(api_key: ENV["API_KEY"], shared_secret: ENV["SHARED_SECRET"])
  end

  it "require Forklift::Utils" do
    require 'forklift/utils'
  end
end

