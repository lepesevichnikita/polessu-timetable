# This class provide a functional for timetable manipulating through mongoid models
class TimetableMongoidRepository < Timetable::Repository::Base
  extend Timetable::Repository::Mongoid

end