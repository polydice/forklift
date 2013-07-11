# -*- encoding : utf-8 -*-
require 'faraday'

# @api private
module Faraday
  class Response::RaiseForkliftError < Response::Middleware
    ERROR_MAP = {
      # 400 => Forklift::BadRequest,
      # 401 => Forklift::Unauthorized,
      # 403 => Forklift::Forbidden,
      # 404 => Forklift::NotFound,
      # 406 => Forklift::NotAcceptable,
      # 422 => Forklift::UnprocessableEntity,
      # 500 => Forklift::InternalServerError,
      # 501 => Forklift::NotImplemented,
      # 502 => Forklift::BadGateway,
      # 503 => Forklift::ServiceUnavailable
      "\n  parameter error\n"                               => Forklift::ParameterError,
      "\n  API OVERUSED\n"                                  => Forklift::ApiOverused,
      "\n  no permission to request!\n"                     => Forklift::NoPermission,
      "\n  signature was not match or timestamp is over!\n" => Forklift::SignatureError,
      "\n  code:302,desc:system error\n"                    => Forklift::SystemError
    }

    def on_complete(response)
      key = response[:body]["errors"]
      raise ERROR_MAP[key].new(response) if ERROR_MAP.has_key? key
    end
  end
end
