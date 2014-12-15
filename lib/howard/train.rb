module Howard
  class Train
    def initialize(api_response)
      @api_response = api_response
    end

    def heading
      @api_response.fetch("heading", "").to_i
    end

    def latitude
      @api_response.fetch("lat", "").to_f
    end

    def longitude
      @api_response.fetch("lon", "").to_f
    end

    def run
      @api_response["rn"]
    end
  end
end
