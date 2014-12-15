module Howard
  class ArrivalsResource
    include Enumerable

    attr_reader :params

    def initialize(params={})
      @params = arrivals_params(params)
    end

    def each
      Array(xml_response["ctatt"]["eta"])
        .map { |eta| Arrival.new(eta) }
        .each { |arrival| yield arrival }
    end

    def gateway
      @gateway ||= TrainTrackerGateway.new(Howard.train_tracker_api_key)
    end

    def xml_response
      @xml_resonse ||= gateway
        .arrivals(query: params)
        .parsed_response
    end

    def arrivals_params(params)
      {
        mapid: params[:mapid] || params[:station],
        stpid: params[:stpid] || params[:stop],
        max: params[:max],
        rt: params[:rt] || params[:route],
      }.reject { |_, val| val.nil? }
    end
  end
end
