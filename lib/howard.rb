require "howard/arrival"
require "howard/arrivals_resource"
require "howard/route"
require "howard/time_to_arrival"
require "howard/train"
require "howard/train_tracker_gateway"
require "howard/version"

module Howard
  def self.api_keys
    keys = key_struct.new
    yield keys
    @@train_tracker_api_key = keys.train_tracker
  end

  def self.train_tracker_api_key
    @@train_tracker_api_key
  end

  def self.arrivals(params={})
    Howard::ArrivalsResource.new(params)
  end

  private
  def self.key_struct
    Struct.new(:train_tracker)
  end
end
