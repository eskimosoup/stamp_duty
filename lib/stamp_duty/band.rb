module StampDuty
  class Band
    # NOTE:
    #   From 1 April 2021, a 2% surcharge will be added to each of the rates below
    #   for buyers who are non-UK residents

    NON_UK_RESIDENT_SURCHARGE = 2

    attr_reader :lower_bound, :upper_bound, :percentage_rate

    def initialize(lower_bound, upper_bound, percentage_rate, uk_resident)
      @lower_bound = lower_bound
      @upper_bound = upper_bound
      @percentage_rate = (uk_resident ? percentage_rate : (percentage_rate + NON_UK_RESIDENT_SURCHARGE))
      @uk_resident = uk_resident
    end

    def description
      return "Up to #{ formatted_upper_bound }" if lower_bound.zero?
      return "Above #{ formatted_lower_bound }+" if upper_bound.nil?
      "Above #{ formatted_lower_bound } and up to #{ formatted_upper_bound }"
    end

    def decimal_percentage_rate
      percentage_rate.to_d / 100
    end

    private

    def formatted_lower_bound
      lower_bound.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
    end

    def formatted_upper_bound
      upper_bound.to_s.reverse.scan(/\d{1,3}/).join(",").reverse
    end
  end
end
