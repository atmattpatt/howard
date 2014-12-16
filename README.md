# Howard

Unofficial client library for the Chicago Transit Authority's Train Tracker API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'howard'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install howard

## Usage

### Train Tracker API Key

In order to use the Train Tracker API, you will need to [apply for an API key](http://www.transitchicago.com/developers/traintracker.aspx).

Once you have your API key, configure it like so:

```ruby
Howard.api_keys do |key|
  key.train_tracker = "your API key here"
end
```

### Train Arrivals

See train arrivals for a given station or stop.

```ruby
arrivals = Howard.arrivals(stop: 41400, max: 5)
arrivals.first.route.full_name # => "Brown Line"
arrivals.first.train.run # => "419"
arrivals.first.train.latitude # => 41.97776
arrivals.first.delayed? # => false
arrivals.first.eta.to_s # => "2 min"
```

## Fine Print

This library is not affiliated with or endorsed by the Chicago Transit Authority.
