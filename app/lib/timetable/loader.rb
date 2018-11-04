require 'open-uri'
require 'nokogiri'

module Timetable
  # Module Timetabe::Loader
  # This module contains a methods for loading a timetables
  module Loader
    extend Helper::Validation

    # Load timetable from url and return in required format
    # @param [String] url - url for loading
    # @param [String, Symbol] format - format_of_return
    # @return [Object] Data in required format
    def get_timetable_from(url, format)
      should_be_instance_of(:url, url, String)
      should_be_instance_of(:format, format, [String, Symbol])
      data = open(url)
      raise "#{format}-format not supported" until respond_to?(format)
      send(format, data)
    end
  end
end
