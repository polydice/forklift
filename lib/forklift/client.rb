module Forklift
  class Client

    def initializer(options={})
      optoins = Forklift.options.merge(options)
      Configuration::VALID_OPTION_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Forklift::Client::Roots
    include Forklift::Client::Sections
    include Forklift::Client::Sites
    include Forklift::Client::Categories
    include Forklift::Client::Subcategories
  end
end