module Timetable
  TIMETABLE_DEFAULT_URL = 'http://www.polessu.by/ruz/tt.xml'.freeze

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
