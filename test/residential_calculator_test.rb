require "test_helper"

class ResidentialCalculatorTest < Minitest::Test
  def test_purchase_price
    calc = StampDuty::ResidentialCalculator.new(125000)

    assert_equal 125000, calc.purchase_price
  end

  def test_purchase_price_is_decimal
    calc = StampDuty::ResidentialCalculator.new(125000)

    assert_instance_of BigDecimal, calc.purchase_price
  end

end
