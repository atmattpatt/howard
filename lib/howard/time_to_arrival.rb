module Howard
  class TimeToArrival
    attr_reader :arrival

    def initialize(arrival)
      @arrival = arrival
    end

    def minutes
      (arrival.arrival_time.to_i - arrival.prediction_time.to_i) / 60
    end

    def to_s(format = "%d min")
      if arrival.delayed?
        "Delayed"
      elsif arrival.approaching?
        "Due"
      else
        format % minutes
      end
    end
  end
end
