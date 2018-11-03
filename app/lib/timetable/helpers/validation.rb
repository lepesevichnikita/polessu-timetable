module Timetable
  module Helper
    # This module provide a validation functional
    module Validation
      module_function

      def validate_attr_in_obj(key, obj)
        raise "#{key} not stored in #{obj}" until obj[key]
      end

      def validate(value)
        raise 'Value is nil' until value
      end

      def should_be_instance_of(attr_name, value, class_object)
        should_be_instance_of(:class_name, class_object, Class)
        unless value.is_a?(class_object)
          raise invalid_instance_message(
            attr_name, class_object.name
          )
        end
      end

      def invalid_instance_message(attr_name, class_name)
        "#{attr_name} should be an instance of #{class_name}"
      end
    end
  end
end
