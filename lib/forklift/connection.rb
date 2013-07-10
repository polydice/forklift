# -*- encoding : utf-8 -*-
require 'faraday_middleware'
require 'faraday/response/raise_forklift_error'

module Forklift
  # @private
  module Connection
    private

    def connection(options={})
      options = {
        :authenticate     => true,
        :force_urlencoded => false,
        :raw              => false
      }.merge(options)

      #if !proxy.nil?
      #  options.merge!(:proxy => proxy)
      #end

      # TODO: Don't build on every request
      connection = Faraday.new(options) do |builder|

        builder.request :url_encoded

        builder.use Faraday::Response::RaiseForkliftError

        builder.use FaradayMiddleware::ParseXml

        builder.adapter self.adapter
      end

      #connection.headers[:user_agent] = user_agent

      connection
    end
  end
end
