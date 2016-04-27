# StampDuty

StampDuty is a stamp duty calculator for the UK property market.  Currently only
for residential property, and doesn't include the extra 3% for owning multiple properties

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'stamp_duty'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stamp_duty

## Usage

```ruby
calc = StampDuty.for(275000)
calc.calculate

# .to_s("F") as returns a big decimal
calc.stamp_duty.to_s("F") # => 3750.0
```

You can also can get each the amount in each band

```ruby
calc.band_amounts.each do |ba|
 puts ba.description
 puts ba.amount.to_s("F")
 puts ba.percentage_rate
end
```

Which would return

Up to 125,000  
0.0  
0

Above 125,000 and up to 250,000  
2500.0  
2

Above 250,000 and up to 925,000  
1250.0  
5


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jdexx/stamp_duty.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

