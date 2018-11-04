require 'nokogiri'
require 'json'

module Timetable
  module Helper
    # This module provide functional for xml data manipulate
    module XML
      extend Validation

      def xml_to_json(xml_data)
        should_be_instance_of(:xml_data, xml_data, Nokogiri::XML)
        hash = xml_to_hash xml_data
        hash.to_json
      end

      def xml_to_hash(xml_data)
        should_be_instance_of(:xml_data, xml_data, Nokogiri::XML)
        hash = {}
        pluralized_required_type = key.to_s.pluralize.downcase.to_sym
        required_types.keys.map do |required_type|
          hash[pluralized_required_type] = get_items_of_required_type_from_xml(
            required_type,
            xml_data
          )
        end
        hash
      end

      def get_items_of_required_type_from_xml(required_type, xml_data)
        should_be_instance_of(:required_type, required_type, [String, Symbol])
        should_be_instance_of(:xml_data, xml_data, Nokogiri::XML)
        xml_items_to_array_of_hashes(
          xml_data.xpath("//#{required_type}")
        )
      end

      def xml_items_to_array_of_hashes(xml_items)
        validate xml_items
        should_be_instance_of(:xml_items, xml_items, Array)
        xml_items.map do |xml_item|
          xml_item_to_hash_with_deep_symbolized_keys xml_item
        end
      end

      # Replace values which keys end with 'ids' to array, from value,
      # splited by coma
      # @param xml_item [Object] Item selected from xml
      # @example 
      #  xml_item_to_deep_symbolized_hash(<classroom id=... name=... capacity=... />)
      #  # result { id: ..., name: ..., capacity: ...}
      # @return [Hash] hash with deep symbolized keys 
      def xml_item_to_hash_with_deep_symbolized_keys(xml_item)
        validate xml_item
        hash = xml_item.to_h
        hash.keys.each do |key|
          process_hash_value_by_key(hash, key) do |value|
            value.split(',') if key.end_with?('ids')
          end
        end
        hash.deep_symbolized_keys!
      end

      # Process value by key in given hash through given block
      # @param hash [Hash] Hash for processing block
      # @param key [String, Symbol] Key of hashes value
      # @yield [value] value of hash by key to the block
      # @yieldparam value [Object] Value of hash by key
      # @yieldreturn [Object] processed value
      def process_hash_value_by_key(hash, key, &block)
        should_be_instance_of(:key, key, [String, Symbol])
        should_be_instance_of(:hash, hash, Hash)
        validate_attr_in_obj(key, hash)
        should_be_instance_of(:block, block, Proc)
        value.frozen = hash[key]
        hash[key] = yield(value) || value
        hash
      end
    end
  end
end
