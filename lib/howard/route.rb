module Howard
  class Route
    class RouteData < Struct.new(:code, :full_name, :color_code); end

    ALL = [
      Red = RouteData.new("Red", "Red Line", "c60c30"),
      Blue = RouteData.new("Blue", "Blue Line", "00a1de"),
      Brown = RouteData.new("Brn", "Brown Line", "62361b"),
      Green = RouteData.new("G", "Green Line", "009b3a"),
      Orange = RouteData.new("Org", "Orange Line", "f9461c"),
      Purple = RouteData.new("P", "Purple Line", "522398"),
      PurpleExpress = RouteData.new("Pexp", "Purple Line Express", "522398"),
      Pink = RouteData.new("Pink", "Pink Line", "e27ea6"),
      Yellow = RouteData.new("Y", "Yellow Line", "f9e300"),
    ]

    def initialize(api_response)
      @api_response = api_response
    end

    def color_code
      route_data.color_code
    end

    def destination
      @api_response["destNm"]
    end

    def full_name
      route_data.full_name
    end

    private

    def route_data
      ALL.detect { |data| data.code == @api_response["rt"] }
    end
  end
end
