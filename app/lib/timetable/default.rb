module Timetable
  # This module contains a constants with default values
  module Default
    # Default encoding for serialization
    # @return [String] Freezed String with default encoding
    ENCODING = 'UTF-8'.freeze

    # Default url of xml with timetable
    # @return [String] Freezed String with default url of xml with timetable
    TIMETABLE_URL = 'http://www.polessu.by/ruz/tt.xml'.freeze

    # Required types of items in xml
    # @return [Hash] Freezed Hash with required types
    REQUIRED_TYPES =
      {
        period: Period,
        daysdef: Daysdef,
        weeksdef: Weeksdef,
        termsdef: Termsdef,
        subject: Subject,
        teacher: Teacher,
        classroom: Classroom,
        grade: Grade,
        class: Group, # it is a students group
        group: Part, # it is a groups part
        lesson: Lesson,
        card: Card
      }.freeze
  end
end
