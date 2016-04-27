require "test_helper"

class BandAmountTest < Minitest::Test

  def test_amount
    band = Minitest::Mock.new
    band.expect :decimal_percentage_rate, 0.05
    band.expect :lower_bound, 100

    calc = StampDuty::BandAmount.new(price: 200, band: band)

    assert_equal 5, calc.amount
  end

end
