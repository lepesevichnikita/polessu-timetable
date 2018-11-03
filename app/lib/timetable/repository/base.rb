require 'nokogiri'

module Timetable
  module Repository
    # Module Timetable::Repository::Base
    # This module provide a base functional for timetables repository
    module Base
      extend Loader
      extend Helper::Validation
      extend Helper::XML

      def self.url
        url || TIMETABE_DEFAULT_URL
      end

      def self.url=(value)
        should_be_instance_of(:url, value, String)
        self.url = value || url
      end

      def self.xml(data)
        res = Nokogiri::XML.new(data)
        res.encoding = DEFAULT_ENCODING
        res
      end

      def self.json(data)
        validate data
        should_be_instance_of(:data, data, Nokogiri::XML)
        xml_data = xml(data)
        xml_data_to_json xml_data
      end
    end
  end
end
