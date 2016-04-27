require "test_helper"

class BandSelectorTest < Minitest::Test
  def test_bands_with_price_of_1000k 
    bands_percentage_rates = StampDuty::BandSelector.new(1000000).bands.map(&:percentage_rate)

    assert_equal [10, 5, 2, 0], bands_percentage_rates
  end

  def test_bands_with_price_of_500k
    bands_percentage_rates = StampDuty::BandSelector.new(500000).bands.map(&:percentage_rate)

    assert_equal [5, 2, 0], bands_percentage_rates
  end

  def test_bands_price_of_150k
    bands_percentage_rates = StampDuty::BandSelector.new(150000).bands.map(&:percentage_rate)

    assert_equal [2, 0], bands_percentage_rates
  end

  def test_bands_price_of_100k
    bands_percentage_rates = StampDuty::BandSelector.new(100000).bands.map(&:percentage_rate)

    assert_equal [0], bands_percentage_rates
  end
end
