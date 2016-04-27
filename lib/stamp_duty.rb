require "bigdecimal"
require "bigdecimal/util"
require "stamp_duty/version"
require "stamp_duty/band"
require "stamp_duty/band_selector"
require "stamp_duty/band_amount"
require "stamp_duty/residential_calculator"

module StampDuty
  def self.for(price)
    bands = StampDuty::BandSelector.new(price).bands
    StampDuty::ResidentialCalculator.new(price, bands)
  end
end
