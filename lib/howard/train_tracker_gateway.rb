require "httparty"

module Howard
  class TrainTrackerGateway
    include HTTParty
    base_uri "http://lapi.transitchicago.com"

    def initialize(api_key)
      self.class.default_params(key: api_key)
    end

    def arrivals(params)
      self.class.get("/api/1.0/ttarrivals.aspx", params)
    end
  end
end
