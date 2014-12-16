require "spec_helper"
require "securerandom"

RSpec.describe Howard do
  describe ".api_keys" do
    it "sets the Train Tracker API key" do
      api_key = SecureRandom.hex(8)
      Howard.api_keys { |key| key.train_tracker = api_key }
      expect(Howard.train_tracker_api_key).to eq(api_key)
    end
  end

  describe ".arrivals" do
    it "returns an ArrivalsResource" do
      expect(Howard.arrivals).to be_a(Howard::ArrivalsResource)
    end

    it "does not make any HTTP calls" do
      Howard.api_keys { |key| key.train_tracker = SecureRandom.hex(8) }
      expect(Howard::TrainTrackerGateway).to receive(:get).never
      Howard.arrivals
    end
  end
end
