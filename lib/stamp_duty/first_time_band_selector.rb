module StampDuty
  class FirstTimeBandSelector
    # @see
    #   https://www.kfh.co.uk/resources/buyers/stamp-duty-calculator

    # Effective from 1 July 2021
    BAND_DATA = [
      { lower_bound: 0, upper_bound: 300_000, percentage_rate: 0 },
      { lower_bound: 300_000, upper_bound: 500_000, percentage_rate: 5 }
    ].freeze

    # NOTE:
    #   From 1 April 2021, a 2% surcharge will be added to each of the rates below
    #   for buyers who are non-UK residents
    NON_UK_RESIDENT_SURCHARGE = 2

    attr_reader :price, :uk_resident

    def initialize(price, uk_resident)
      @price = price
      @uk_resident = uk_resident
    end

    def bands
      sorted_band_data.map { |band_data| build_band(band_data) }
    end

    private

    def build_band(band_data)
      percentage_rate = uk_resident ? band_data[:percentage_rate] : band_data[:percentage_rate] + NON_UK_RESIDENT_SURCHARGE
      StampDuty::Band.new(band_data[:lower_bound], band_data[:upper_bound], percentage_rate)
    end

    def sorted_band_data
      band_data_for_price.sort_by { |band| band[:lower_band] }.reverse!
    end

    def band_data_for_price
      BAND_DATA.select { |band| price > band[:lower_bound] }
    end
  end
end
