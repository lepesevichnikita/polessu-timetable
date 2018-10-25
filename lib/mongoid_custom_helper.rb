module MongoidCustomHelper

  def self.alias_and_setter(alias_name, target)
    alias_method alias_name, target
    alias_name_setter = "#{ alias_name }="
    target_setter = "#{ target }="
    alias_method alias_name_setter, target_setter
    define_method alias_name_setter do |value|
      send(target_setter, value.split(',')) if !value.empty?
    end
  end
  
end
