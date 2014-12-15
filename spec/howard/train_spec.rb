require "spec_helper"

RSpec.describe Howard::Train do
  describe "#heading" do
    it "returns the heading of the train" do
      train = Howard::Train.new("heading" => "299")
      expect(train.heading).to eq(299)
    end
  end

  describe "#latitude" do
    it "returns the latitudinal position of the train" do
      train = Howard::Train.new("lat" => "41.97776")
      expect(train.latitude).to eq(41.97776)
    end
  end

  describe "#longitude" do
    it "returns the longitudinal position of the train" do
      train = Howard::Train.new("lon" => "-87.77567")
      expect(train.longitude).to eq(-87.77567)
    end
  end

  describe "#run" do
    it "returns the train run number" do
      train = Howard::Train.new("rn" => "419")
      expect(train.run).to eq("419")
    end
  end
end
