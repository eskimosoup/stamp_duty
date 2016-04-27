module StampDuty
  class Band
    attr_reader :lower_bound, :upper_bound, :percentage_rate

    def initialize(lower_bound, upper_bound, percentage_rate)
      @lower_bound = lower_bound
      @upper_bound = upper_bound
      @percentage_rate = percentage_rate
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
