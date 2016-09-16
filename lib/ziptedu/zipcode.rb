require 'json'

module Ziptedu
  class Zipcode
  	attr_accessor :zipcode, :city, :state, :latitude, :longitude
  	attr_reader :type

  	def initialize
  	  yield self if block_given?
  	end

  	def type=(type)
  	  @type = type.downcase
  	end

  	def to_s
  	  JSON.pretty_generate({ zipcode: zipcode, type: type, city: city, state: state, latitude: latitude, longitude: longitude })
  	end
  end
end