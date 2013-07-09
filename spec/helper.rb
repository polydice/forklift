require 'simplecov'
require 'coveralls'


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'forklift'
require 'rspec'
require 'webmock/rspec'

WebMock.disable_net_connect!(:allow => 'coveralls.io')

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def github_url(url)
  if url =~ /^http/
    url
  elsif @client && @client.authenticated?
    "https://#{@client.login}:#{@client.password}@api.github.com#{url}"
  else
    "https://api.github.com#{url}"
  end
end