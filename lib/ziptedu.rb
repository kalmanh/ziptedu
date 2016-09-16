require "ziptedu/version"
require "ziptedu/zipcode"
require "ziptedu/zipcode_parser"

module Ziptedu
  class << self

    ZIPS_CSV_FILE = File.join(__dir__, 'data', 'zips.csv')

    def initialize
      zipcodes
    end

    def random(how_many = 1)
      zipcodes.sample(how_many)
    end

    def zipcode(zipcode)
      zipcodes.find { |zip| zip.zipcode == zipcode.to_s }
    end

    def citystate(city, state)
      zipcodes.find { |zip| zip.city.upcase == city.upcase && zip.state.upcase == state.upcase }
    end

    def latlong(latitude, longitude)
      zipcodes.reject { |zip| !zip.longitude || !zip.latitude }
        .find { |zip| zip.latitude.upcase == latitude.to_s.upcase && zip.longitude.upcase == longitude.to_s.upcase }
    end

    private

    def zipcodes
      # Cache zipcodes after doing this once...
      @zipcodes ||= ZipcodeParser.parse ZIPS_CSV_FILE
    end

  end
end