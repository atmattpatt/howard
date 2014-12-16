require "spec_helper"

RSpec.describe Howard::TimeToArrival do
  describe "#to_s" do
    it "shows minutes to arrival" do
      arrival = Howard::Arrival.new(
        "prdt" => "20110618 23:26:12",
        "arrT" => "20110618 23:28:47",
        "isDly" => "0",
        "isApp" => "0",
      )
      eta = Howard::TimeToArrival.new(arrival)

      expect(eta.to_s).to eq("2 min")
    end

    it "respects the format provided" do
      arrival = Howard::Arrival.new(
        "prdt" => "20110618 23:26:12",
        "arrT" => "20110618 23:28:47",
        "isDly" => "0",
        "isApp" => "0",
      )
      eta = Howard::TimeToArrival.new(arrival)

      expect(eta.to_s("about %d minutes")).to eq("about 2 minutes")
    end

    it "shows 'Delayed' when a train is delayed" do
      arrival = Howard::Arrival.new(
        "prdt" => "20110618 23:26:12",
        "arrT" => "20110618 23:28:47",
        "isDly" => "1",
        "isApp" => "0",
      )
      eta = Howard::TimeToArrival.new(arrival)

      expect(eta.to_s).to eq("Delayed")
    end

    it "shows 'Due' when a train is arriving" do
      arrival = Howard::Arrival.new(
        "prdt" => "20110618 23:26:12",
        "arrT" => "20110618 23:28:47",
        "isDly" => "0",
        "isApp" => "1",
      )
      eta = Howard::TimeToArrival.new(arrival)

      expect(eta.to_s).to eq("Due")
    end
  end

  describe "#minutes" do
    it "returns the number of minutes until a train arrives as an integer" do
      arrival = Howard::Arrival.new(
        "prdt" => "20110618 23:26:12",
        "arrT" => "20110618 23:28:47",
        "isDly" => "0",
        "isApp" => "0",
      )
      eta = Howard::TimeToArrival.new(arrival)

      expect(eta.minutes).to eq(2)
    end
  end
end
