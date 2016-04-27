require "test_helper"

class ResidentialCalculatorTest < Minitest::Test

  def test_purchase_price_is_decimal
    calc = StampDuty::ResidentialCalculator.new(125000, nil)

    assert_instance_of BigDecimal, calc.purchase_price
  end

  def test_stamp_duty_when_price_is_125k
    calc = StampDuty.for(125000)

    assert_equal 0, calc.stamp_duty
  end

  def test_stamp_duty_when_price_is_250k
    calc = StampDuty.for(250000)

    calc.calculate

    assert_equal 2500, calc.stamp_duty
  end

  def test_stamp_duty_when_price_is_925k
    calc = StampDuty.for(925000)

    calc.calculate

    assert_equal 36250, calc.stamp_duty
  end

  def test_stamp_duty_when_price_is_1500k
    calc = StampDuty.for(1500000)

    calc.calculate

    assert_equal 93750, calc.stamp_duty
  end

  def test_stamp_duty_when_price_is_1600k
    calc = StampDuty.for(1600000)

    calc.calculate

    assert_equal 105750, calc.stamp_duty
  end
end
