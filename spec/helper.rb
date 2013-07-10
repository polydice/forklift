# -*- encoding : utf-8 -*-
require 'simplecov'
require 'coveralls'
require 'uri'
require 'cgi'


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'forklift'
require 'rspec'
require 'webmock/rspec'
require 'vcr'
require 'dotenv'

Dotenv.load
ENV["API_KEY"]       = "thisisisapikey"
ENV["SHARED_SECRET"] = "thisisisisisshared_secret"

#WebMock.disable_net_connect!(:allow => 'coveralls.io')

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

VCR.configure do |c|
  c.cassette_library_dir     = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  
  c.register_request_matcher :query_without_key_and_signature do |request_1, request_2|
    q1 = URI(request_1.uri).query || ""
    q2 = URI(request_2.uri).query || ""

    q1 = CGI.parse(q1)
    q2 = CGI.parse(q2)

    [q1, q2].each do |q|
      q.delete("pkey")
      q.delete("signature")
    end

    q1 == q2
  end

  c.default_cassette_options = {:match_requests_on => [:method, :host, :path, :query_without_key_and_signature]}
end

#def fixture_path
#  File.expand_path("../fixtures", __FILE__)
#end
#
#def fixture(file)
#  File.new(fixture_path + '/' + file)
#end
#
#def github_url(url)
#  if url =~ /^http/
#    url
#  elsif @client && @client.authenticated?
#    "https://#{@client.login}:#{@client.password}@api.github.com#{url}"
#  else
#    "https://api.github.com#{url}"
#  end
#end
