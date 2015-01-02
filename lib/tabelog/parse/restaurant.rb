require "json"

module Tabelog
  module Parse
    class Restaurant
      def initialize(attrs = {})
        @name = attrs[:name]
        @genre = attrs[:genre]
        @address = attrs[:address]
        @map_url = attrs[:map_url]
      end

      def to_json
        {
          name: @name,
          genre: @genre,
          address: @address,
          mapUrl: @map_url
        }.to_json
      end
    end
  end
end
