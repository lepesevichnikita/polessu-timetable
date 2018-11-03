require 'nokogiri'
require 'json'

module Timetable
  module Helper
    # Module Timetable::Helper::XML
    # This module provide functional for xml data manipulate
    module XML
      extend Validation

      def xml_data_to_json(xml_data)
        validate xml_data
        should_be_instance_of(:xml_data, xml_data, Nokogiri::XML)
        hash = {}
        REQUIRED_TYPES.keys.map do |required_type|
          hash[key.to_s.pluralize.to_sym] = get_items_of_required_type_from_xml(
            required_type,
            xml_data
          )
        end
        hash.to_json
      end

      def get_items_of_required_type_from_xml(required_type, xml_data)
        validate required_type
        validate xml_data
        should_be_instance_of(:xml_data, xml_data, Nokogiri::XML)
        xml_items_to_array_of_hashes_with_symbolized_keys(
          xml_data.xpath("//#{required_type}")
        )
      end

      def xml_items_to_array_of_hashes(xml_items)
        validate xml_items
        should_be_instance_of(:xml_items, xml_items, Array)
        xml_items.map { |xml_item| xml_item_to_deep_symbolized_hash xml_item }
      end

      def xml_item_to_deep_symbolized_hash(xml_item)
        validate xml_item
        hash = xml_item.to_h
        hash.keys.each do |key|
          if key.end_with?('ids')
            hash[key] = split_string_value_by_separator_in_hash(hash, key)
          end
        end
        hash.deep_symbolized_keys!
      end

      def split_string_value_by_separator_in_hash(hash, key, separator = ',')
        validate separator
        should_be_instance_of(:separator, separator, String)
        value = hash[key]
        validate_key_in_object(key, hash)
        should_be_instance_of(key, hash[key], String)
        hash[key] = value.split(separator)
      end
    end
  end
end
