require 'open-uri'
require 'nokogiri'

module Timetable
  # Module Timetabe::Loader
  # This module contains a methods for loading a timetables
  module Loader
    extend Helper::XML
    extend Helper::Validation

    # Load timetable from url and return in required format
    # @param [String] url - url for loading
    # @param [String, Symbol] format - format_of_return
    # @return [Object] Data in required format
    def get_timetable_from(url, format = :xml)
      should_be_instance_of(:url, url, String)
      data = open(url)
      raise "#{format}-format not supported" until respond_to?(format)
      send(format, data)
    end

    # Data to XML
    # @param [Object] data - data of any type, which supported by Nokogiri::XML
    # @return [Nokogiri::XML] Data in xml
    def xml(data)
      validate data
      res = Nokogiri::XML.new(data)
      res.encoding = DEFAULT_ENCODING
      res
    end

    # Data to JSON-string from XML
    # @param [Nokogiri::XML] data - data in XML
    # @return [String] Data in JSON
    def json(data)
      should_be_instance_of(:data, data, Nokogiri::XML)
      xml_data = xml(data)
      xml_data_to_json xml_data
    end
  end
end
