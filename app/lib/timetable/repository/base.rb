require 'nokogiri'

module Timetable
  module Repository
    # This module provide a base functional for timetables repository
    #
    # @!attribute timetable_url
    #  @return [String] String with url
    #
    # @!attribute required_types
    #  @return [Hash<Symbol, Class>] Hash, that contains types as keys and types classes as values
    #
    # @!attribute encoding [String]
    #  @return [String] String with encoding type
    module Base
      include Loader
      include Helper::XML
      include Helper::Validation

      mattr_accessor :timetable_url, default: Default::TIMETABLE_URL
      mattr_accessor :required_types, default: Default::REQUIRED_TYPES
      mattr_accessor :encoding, default: Default::ENCODING

      # Data to XML
      # @param [Object] data - data of any type, which supported by Nokogiri::XML
      # @return [Nokogiri::XML] Data in xml
      def xml(data)
        validate data
        res = Nokogiri::XML(data)
        res.encoding = encoding
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
end
