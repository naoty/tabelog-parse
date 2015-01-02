module Tabelog
  module Parse
    class Client
      def initialize
      end

      def get_restaurant(url: "")
        connection.get(url)
      end

      private

      def connection
        @connection ||= Faraday.new do |connection|
          connection.response :json
          connection.response :tabelog
          connection.adapter Faraday.default_adapter
        end
      end
    end
  end
end