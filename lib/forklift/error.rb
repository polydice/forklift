# -*- encoding : utf-8 -*-
module Forklift
  # Custom error class for rescuing from all GitHub errors
  class Error < StandardError
    def initialize(response=nil)
      @response = response
      super(response[:body]["errors"].gsub("\n", ""))
    end
  end

  class ParameterError < Error; end
  class ApiOverused < Error; end
  class NoPermission < Error; end
  class SignatureError < Error; end
end
