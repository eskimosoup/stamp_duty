module StampDuty
  class BandAmount
    extend Forwardable

    def_delegators :@band, :lower_bound, :percentage_rate, :decimal_percentage_rate, :description
    attr_reader :price, :band

    def initialize(price:, band:)
      @price = price
      @band = band
    end

    def amount
      @amount ||= decimal_percentage_rate * rateable_amount
    end

    private

    def rateable_amount
      @rateable_amount ||= price - lower_bound
    end

  end
end
