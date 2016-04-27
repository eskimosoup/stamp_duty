require "test_helper"

class BandTest < Minitest::Test
  def test_description_when_in_lowest_band
    band = StampDuty::Band.new(0, 125000, 0)

    assert_equal "Up to 125,000", band.description
  end

  def test_description_when_in_highest_band
    band = StampDuty::Band.new(1500000, nil, 0)

    assert_equal "Above 1,500,000+", band.description
  end

  def test_description_when_in_middle_band
    band = StampDuty::Band.new(250000, 925000, 0)

    assert_equal "Above 250,000 and up to 925,000", band.description
  end

  def test_decimal_percentage_rate
    band = StampDuty::Band.new(0, 0, 5)

    assert_equal 0.05, band.decimal_percentage_rate
  end
end
