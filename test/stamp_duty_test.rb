require "test_helper"

class StampDutyTest < Minitest::Test
  def test_stamp_duty_when_price_is_125k
    calc = StampDuty::ResidentialCalculator.new(125000)

    assert_equal 0, calc.stamp_duty
  end

  def test_stamp_duty_when_price_is_250k
    calc = StampDuty::ResidentialCalculator.new(250000)

    assert_equal 2500, calc.stamp_duty
  end

  def test_stamp_duty_when_price_is_925k
    calc = StampDuty::ResidentialCalculator.new(925000)

    assert_equal 36250, calc.stamp_duty
  end

  def test_stamp_duty_when_price_is_1500k
    calc = StampDuty::ResidentialCalculator.new(1500000)

    assert_equal 93750, calc.stamp_duty
  end

  def test_stamp_duty_when_price_is_1600k
    calc = StampDuty::ResidentialCalculator.new(1600000)

    assert_equal 105750, calc.stamp_duty
  end
end
