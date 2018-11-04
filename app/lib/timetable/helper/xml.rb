require 'nokogiri'
require 'json'

module Timetable
  module Helper
    # This module provide functional for xml data manipulate
    module XML
      extend Validation

      def xml_to_json(xml_data)
        should_be_instance_of(:xml_data, xml_data, Nokogiri::XML::Document)
        hash = xml_to_hash xml_data
        hash.to_json
      end

      def xml_to_hash(xml_data)
        should_be_instance_of(:xml_data, xml_data, Nokogiri::XML::Document)
        hash = {}
        required_types.keys.map do |xml_required_type|
          odm_required_type = type_aliases[xml_required_type] || xml_required_type
          odm_pluralized_required_type = odm_required_type.to_s.pluralize.downcase.to_sym
          hash[odm_pluralized_required_type] = get_items_of_required_type_from_xml(
            xml_data,
            xml_required_type
          )
        end
        hash
      end

      def get_items_of_required_type_from_xml(xml_data, required_type)
        should_be_instance_of(:required_type, required_type, [String, Symbol])
        should_be_instance_of(:xml_data, xml_data, Nokogiri::XML::Document)
        xml_items_to_array_of_hashes(
          xml_data.xpath("//#{required_type}")
        )
      end

      def xml_items_to_array_of_hashes(xml_items)
        validate xml_items
        should_be_instance_of(:xml_items, xml_items, Nokogiri::XML::NodeSet)
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
        rename_key_in_hash hash, 'id', '_id'
        add_down_line_before_suffix_in_hash_keys hash
        replace_value_in_key_ends_with_ids_to_array hash
        hash.deep_symbolize_keys!
      end

      # Process value by key in given hash through given block
      # @param hash [Hash<String, String>] Hash for processing block
      # @param key [String, Symbol] Key of hashes value
      # @yield [value] value of hash by key to the block
      # @yieldparam value [Object] Value of hash by key
      # @yieldreturn [Object] processed value
      def replace_hash_value_to_new(hash, key, &block)
        should_be_instance_of(:key, key, [String, Symbol])
        should_be_instance_of(:hash, hash, Hash)
        should_be_instance_of(:block, block, Proc)
        value = hash[key].freeze
        hash[key] = yield(value) || value
        hash
      end

      # Rename key in hash from old key to new key
      # @param hash [Hash] Hash for processing
      # @param old_key [String, Symbol] Old key name
      # @param new_key [String, Symbol] New key name
      def rename_key_in_hash(hash, old_key, new_key)
        hash[new_key] = hash.delete(old_key) if hash.key?(old_key)
      end

      def add_down_line_before_suffix_in_hash_keys(hash, suffix = 'ids')
        hash.keys.each do |key|
          rename_key_in_hash(hash, key, key.sub(suffix, "_#{suffix}"))
        end
      end

      def replace_value_in_key_ends_with_ids_to_array(hash)
        hash.keys.each do |key|
          if key.end_with?('ids')
            replace_hash_value_to_new(hash, key) { |value| value.split(',') }
          end
        end
      end
    end
  end
end
