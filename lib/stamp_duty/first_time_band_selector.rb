module StampDuty
  class FirstTimeBandSelector
    #BAND_DATA = [
    #  { lower_bound: 0, upper_bound: 300_000, percentage_rate: 0 },
    #  { lower_bound: 300_000, upper_bound: 500_000, percentage_rate: 5 }
    #].freeze

    BAND_DATA = [
      { lower_bound: 0, upper_bound: 500_000, percentage_rate: 0 } #,
      # { lower_bound: 500_000, upper_bound: 500_000, percentage_rate: 5 }
    ].freeze

    attr_reader :price

    def initialize(price)
      @price = price
    end

    def bands
      sorted_band_data.map { |band_data| build_band(band_data) }
    end

    private

    def build_band(band_data)
      StampDuty::Band.new(band_data[:lower_bound], band_data[:upper_bound], band_data[:percentage_rate])
    end

    def sorted_band_data
      band_data_for_price.sort_by { |band| band[:lower_band] }.reverse!
    end

    def band_data_for_price
      BAND_DATA.select { |band| price > band[:lower_bound] }
    end
  end
end
