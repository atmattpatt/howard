require "spec_helper"

RSpec.describe Howard::ArrivalsResource do
  let(:arrivals) { Howard::ArrivalsResource.new }

  describe "#each" do
    before(:each) do
      @api_response = {"ctatt" => {"eta" => [{"rn" => "419"}, {"rn" => "519"}]}}
      allow(arrivals).to receive(:xml_response) { @api_response }
    end

    it "can iterate over arrivals" do
      expect(arrivals.count).to eq(2)
    end

    it "returns Howard::Arrival objects" do
      arrivals.each do |arrival|
        expect(arrival).to be_a(Howard::Arrival)
      end
    end
  end
end
