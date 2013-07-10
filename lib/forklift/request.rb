require 'openssl'

module Forklift
  module Request

    def get_catalog(options={})
      options[:ts]        = get_current_time
      options[:pkey]      = self.api_key
      options[:signature] = get_signature(options)
      response            = request(:get, "getCatalog", options)

      body = response.body

      # TODO: implement auto traversal
      #if auto_traversal && body.is_a?(Array)
      #  while next_url = links(response)["next"]
      #    response = request(:get, next_url, options)
      #    body += response.body
      #  end
      #end

      body
    end

    def get_gd_info(options={})
      options[:ts]        = get_current_time
      options[:pkey]      = self.api_key
      options[:signature] = get_signature(options)
      response            = request(:get, "getGdInfo", options)

      body = response.body
      body
    end

    def get_current_time
      connection(:url => 'http://tw.partner.buy.yahoo.com/api/v1').get('getCurrTime').body["currentTime"]
    end

    private

    # Executes the request, checking if it was successful
    #
    # @return [Boolean] True on success, false otherwise
    #def boolean_from_response(method, path, options={})
    # request(method, path, options).status == 204
    #rescue Octokit::NotFound
    #  false
    #end

    def request(method, path, options={})
      path.sub(%r{^/}, '') # remove leading slash
      path = URI.encode path

      force_urlencoded = options.delete(:force_urlencoded) || false

      url = options.delete(:endpoint) || self.api_endpoint
      url += options.delete(:api_version) || self.api_version

      conn_options = {
        :force_urlencoded => force_urlencoded,
        :url => url
      }

      response = connection(conn_options).send(method) do |request|

        case method
        when :get
          request.url(path, options)
        end
      end

      response
    end

    def get_signature(options)
      content = Faraday::Utils::ParamsHash
                  .new
                  .replace(
                    options.select {|k, v| k.to_s.match(/pkey|ts|no|level_no/)}
                  )
                  .to_query

      digest = OpenSSL::Digest::Digest.new('sha1')
      return OpenSSL::HMAC.hexdigest(digest, self.shared_secret, content)
    end

    def links(response)
      links = ( response.headers["Link"] || "" ).split(', ').map do |link|
        url, type = link.match(/<(.*?)>; rel="(\w+)"/).captures
        [ type, url ]
      end

      Hash[ *links.flatten ]
    end

  end
end

