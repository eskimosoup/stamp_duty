module StampDuty
  class ResidentialCalculator

    attr_reader :purchase_price

    def initialize(purchase_price)
      @purchase_price = purchase_price.to_d
    end

    def stamp_duty
      case
      when purchase_price <= 125000
        0
      when purchase_price <= 250000
        calculate_up_to_250k_bound(purchase_price)
      when purchase_price <= 925000
        calculate_up_to_925k_bound(purchase_price) + calculate_up_to_250k_bound(250000)
      when purchase_price <= 1500000
        calculate_up_to_1500k_bound(purchase_price) +
          calculate_up_to_925k_bound(925000) +
          calculate_up_to_250k_bound(250000)
      when purchase_price > 1500000
        calculate_over_1500k_bound(purchase_price) +
        calculate_up_to_1500k_bound(1500000) +
          calculate_up_to_925k_bound(925000) +
          calculate_up_to_250k_bound(250000)
      end
    end

    def calculate_up_to_250k_bound(amount)
      (amount - 125000) * 0.02
    end

    def calculate_up_to_925k_bound(amount)
      (amount - 250000) * 0.05
    end

    def calculate_up_to_1500k_bound(amount)
      (amount - 925000) * 0.10
    end

    def calculate_over_1500k_bound(amount)
      (amount - 1500000) * 0.12
    end

  end
end
