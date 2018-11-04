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
      include Helper::Validation

      mattr_accessor :timetable_url, default: Default::TIMETABLE_URL
      mattr_accessor :required_types, default: Default::REQUIRED_TYPES
      mattr_accessor :encoding, default: Default::ENCODING

    end
  end
end
