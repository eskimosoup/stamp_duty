module StampDuty
  class ResidentialCalculator

    attr_reader :purchase_price, :band_amounts, :bands

    def initialize(purchase_price, bands)
      @purchase_price = purchase_price.to_d
      @bands = bands
      @band_amounts = []
    end

    def stamp_duty
      band_amounts.map(&:amount).reduce(0, :+)
    end

    def calculate
      price = purchase_price
      while price > 0
        bands.each do |band|
          add_band_amount(band, price)
          price = band.lower_bound
        end
      end
    end

    private

    def add_band_amount(band, price)
      @band_amounts.unshift(StampDuty::BandAmount.new(price: price, band: band))
    end
  end
end
