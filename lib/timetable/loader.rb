require 'open-uri'

module Timetable
  # Module Timetabe::Loader
  # This module contains a methods for loading a timetables
  module Loader
    DEFAULT_ENCODING = 'UTF-8'.freeze

    def self.get_timetable_from(url, format = :xml)
      data = open(url)
      send(format, data)
    end
  end
end
