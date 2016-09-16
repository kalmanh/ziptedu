require 'csv'

module Ziptedu
  class ZipcodeParser

  	def self.parse(csv_file_path)
  	  # Initialize to an empty array
      zipcodes = []

      # We only care about a subset of columns in the CSV file
      # Map the attributes in the Zipcode class to headers in CSV file
      attr_to_csv_mapping = {
      	zipcode: "Zipcode",
        type: "ZipCodeType",
        city: "City",
       	state: "State",
        latitude: "Lat",
        longitude: "Long"
      }

	  CSV.foreach(csv_file_path, headers: true) do |data|

    	zipcode = Zipcode.new do |zip|
    		attr_to_csv_mapping.each do |attr, csv_header_name|
    			zip.send "#{attr}=", data[csv_header_name]
    		end
    	end

        zipcodes << zipcode
      end

      zipcodes
  	end

  end
end