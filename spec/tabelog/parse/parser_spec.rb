require "spec_helper"

RSpec.describe Tabelog::Parse::Parser do
  describe "#parse" do
    let(:parser) do
      described_class.new
    end

    let(:fixtures_path) do
      path = File.expand_path("../../fixtures", __dir__)
      Pathname.new(path)
    end

    let(:html) do
      fixtures_path.join("oniyanma.html").read
    end

    let(:restaurant) do
      parser.parse(html)
    end

    subject do
      restaurant
    end

    it "returns a Faraday::Tabelog::Restaurant" do
      expect(subject.name).to eq "おにやんま"
      expect(subject.genre).to eq "うどん、郷土料理（その他）"
      expect(subject.address).to eq "東京都品川区西五反田1-6-3"
    end
  end
end