require "nokogiri"
require "yaml"

module Tabelog
  module Parse
    class Parser
      def parse(html)
        document = Nokogiri::HTML(html)
        table = document.css("#contents-rstdata table.rst-data").first
        nodes = table.css("tr")
        address = trim(nodes[3].css("p").first.inner_text)

        attrs = {
          name: trim(nodes[0].css("strong").inner_text),
          genre: trim(nodes[1].css("p").inner_text),
          address: address,
          map_url: map_url(address: address)
        }
        Restaurant.new(attrs)
      end

      private

      def trim(string)
        string.gsub(%r{(^[\s#{$/}]+|[\s#{$/}]+$)}) { "" }
      end

      def map_url(address: "")
        "https://www.google.com/maps/embeded/v1/place?key=#{google_api_key}&q=#{address}"
      end

      def google_api_key
        path = File.expand_path("../../../secrets.yml", __dir__)
        secrets = YAML.load_file(path)
        secrets["google_api_key"]
      end
    end
  end
end
