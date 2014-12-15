require "spec_helper"

RSpec.describe Howard::Arrival do
  describe "#train" do
    it "returns a Howard::Train instance" do
      arrival = Howard::Arrival.new("rn" => "419")
      expect(arrival.train).to be_a(Howard::Train)
    end

    it "provides the train run number" do
      arrival = Howard::Arrival.new("rn" => "419")
      expect(arrival.train.run).to eq("419")
    end

    it "provides the latitude of the train" do
      arrival = Howard::Arrival.new("lat" => "41.97776")
      expect(arrival.train.latitude).to eq(41.97776)
    end

    it "provides the longitude of the train" do
      arrival = Howard::Arrival.new("lon" => "-87.77567")
      expect(arrival.train.longitude).to eq(-87.77567)
    end

    it "provides the heading of the train" do
      arrival = Howard::Arrival.new("heading" => "299")
      expect(arrival.train.heading).to eq(299)
    end
  end

  describe "#prediction_time" do
    it "returns the date/time of the prediction" do
      arrival = Howard::Arrival.new("prdt" => "20110618 23:26:12")
      expect(arrival.prediction_time.year).to eq(2011)
      expect(arrival.prediction_time.month).to eq(6)
      expect(arrival.prediction_time.day).to eq(18)
      expect(arrival.prediction_time.hour).to eq(23)
      expect(arrival.prediction_time.min).to eq(26)
      expect(arrival.prediction_time.sec).to eq(12)
      expect(arrival.prediction_time.zone).to eq("CDT")
    end
  end

  describe "#arrival_time" do
    it "returns the date/time of the predicted arrival" do
      arrival = Howard::Arrival.new("arrT" => "20110618 23:26:12")
      expect(arrival.arrival_time.year).to eq(2011)
      expect(arrival.arrival_time.month).to eq(6)
      expect(arrival.arrival_time.day).to eq(18)
      expect(arrival.arrival_time.hour).to eq(23)
      expect(arrival.arrival_time.min).to eq(26)
      expect(arrival.arrival_time.sec).to eq(12)
      expect(arrival.arrival_time.zone).to eq("CDT")
    end
  end

  describe "#approaching?" do
    it "is true when the train is approaching" do
      arrival = Howard::Arrival.new("isApp" => "1")
      expect(arrival.approaching?).to be_truthy
    end

    it "is false when the train is not approaching" do
      arrival = Howard::Arrival.new("isApp" => "0")
      expect(arrival.approaching?).to be_falsey
    end
  end

  describe "#scheduled?" do
    it "is true when the train arrival is based on the schedule" do
      arrival = Howard::Arrival.new("isSch" => "1")
      expect(arrival.scheduled?).to be_truthy
    end

    it "is false when the train arrival is based on a live prediction" do
      arrival = Howard::Arrival.new("isSch" => "0")
      expect(arrival.scheduled?).to be_falsey
    end
  end

  describe "#live?" do
    it "is true when the train arrival is based on a live prediction" do
      arrival = Howard::Arrival.new("isSch" => "0")
      expect(arrival.live?).to be_truthy
    end

    it "is false when the train arrival is based on the schedule" do
      arrival = Howard::Arrival.new("isSch" => "1")
      expect(arrival.live?).to be_falsey
    end
  end

  describe "#fault?" do
    it "is true when a fault has been detected" do
      arrival = Howard::Arrival.new("isFlt" => "1")
      expect(arrival.fault?).to be_truthy
    end

    it "is false when a fault has not been detected" do
      arrival = Howard::Arrival.new("isFlt" => "0")
      expect(arrival.fault?).to be_falsey
    end
  end

  describe "#delayed?" do
    it "is true when a train is delayed" do
      arrival = Howard::Arrival.new("isDly" => "1")
      expect(arrival.delayed?).to be_truthy
    end

    it "is false when a train is not delayed" do
      arrival = Howard::Arrival.new("isDly" => "0")
      expect(arrival.delayed?).to be_falsey
    end
  end
end
