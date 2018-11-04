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

    # Data to JSON-string
    # @param [Object] data - data of any type, which supported by Nokogiri::XML
    # @note data wil be converted into Nokogiri::XML and then to json
    # @return [String] Data in JSON
    def json(data)
      xml_data = xml(data)
      xml_to_json xml_data
    end

    # Data to ruby Hash
    # @param [Object] data - data of any type, which supported by Nokogiri::XML
    # @note data wil be converted into Nokogiri::XML and then to hash
    # @return [Hash] Data in hash
    def hash(data)
      xml_data = xml(data)
      xml_to_hash xml_data
    end
  end
end
