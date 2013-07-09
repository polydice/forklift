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
      Forklift::ParameterError,
      Forklift::ApiOverused,
      Forklift::NoPermission,
      Forklift::SignatureError
    }

    def on_complete(response)
      # response

      # key = response[:status].to_i
      # raise ERROR_MAP[key].new(response) if ERROR_MAP.has_key? key
    end
  end
end
