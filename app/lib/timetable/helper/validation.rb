module Timetable
  module Helper
    # This helper provide a validation functional
    module Validation
      module_function

      #  Raise error if passed hash doesn't contains value by passed key
      # @param [String, Symbol] key - name of objects attribute or key of hash
      # @param [Hash] hash - hash, which should contains passed key or attribute
      def validate_attr_in_obj(key, hash)
        raise "#{key} not stored in #{hash}" until hash.key?(key)
      end

      #  Raise error if value.nil?
      # @param [Object] value - object of any type except Nil
      def validate(value)
        raise 'Value is nil' if value.nil?
      end

      #  Raise error if passed value is not instance of passed type
      # @param [String, Symbol] attr_name - name of passed value for message
      # @param [Object] value - value of passed type
      # @param [Class] type - type, that value should have
      # @note Type can be even Nil
      def should_be_instance_of(attr_name, value, type)
        should_be_instance_of(:class_name, type, Class)
        unless value.is_a?(type)
          raise invalid_instance_message(
            attr_name, type.name
          )
        end
      end

      # Build message for should_be_instance_of method
      # @param [String, Symbol] attr_name - name of attribute
      # @param [String, Symbol] class_name - name of class
      # @return [String] text for message
      def invalid_instance_message(attr_name, class_name)
        validate attr_name
        validate class_name
        "#{attr_name} should be an instance of #{class_name}"
      end
    end
  end
end
