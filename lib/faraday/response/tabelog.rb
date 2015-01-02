module Faraday
  class Response
    class Tabelog < Middleware
      def initialize(app)
        super(app)
        @parser = ::Tabelog::Parse::Parser.new
      end

      def parse(body)
        @parser.parse(body)
      end
    end

    register_middleware tabelog: Tabelog
  end
end
