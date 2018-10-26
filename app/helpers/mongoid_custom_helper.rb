module MongoidCustomHelper
  def setter_alias(alias_name, target)
    alias_setter_method_name = "#{ alias_name }="
    target_setter_method_name = "#{ target }="
    alias_method alias_setter_method_name, target_setter_method_name
    define_method alias_setter_method_name do |value|
      if value.kind_of?(String)
        value = value.empty? ? [] : value.split(',')
      end
      self.send(target_setter_method_name, value)
    end
  end

end
