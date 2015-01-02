module Faraday
  class Response
    class JSON < Middleware
      def parse(body)
        body.to_json
      end
    end

    register_middleware json: JSON
  end
end