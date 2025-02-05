require "bigdecimal"
require "bigdecimal/util"
require "stamp_duty/version"
require "stamp_duty/band"
require "stamp_duty/standard_band_selector"
require "stamp_duty/buy_to_let_second_home_band_selector"
require "stamp_duty/first_time_band_selector"
require "stamp_duty/band_amount"
require "stamp_duty/residential_calculator"

module StampDuty
  def self.for(price, buy_to_let_second_home = false, first_time_buyer = false, uk_resident = true)
    if buy_to_let_second_home == true
      bands = StampDuty::BuyToLetSecondHomeBandSelector.new(price, uk_resident).bands
    elsif first_time_buyer == true && price <= 625_001
      bands = StampDuty::FirstTimeBandSelector.new(price, uk_resident).bands
    else
      bands = StampDuty::StandardBandSelector.new(price, uk_resident).bands
    end

    StampDuty::ResidentialCalculator.new(price, bands)
  end
end
