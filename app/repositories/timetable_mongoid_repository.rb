# This class provide a functional for timetable manipulating through mongoid models
require 'timetable'
class TimetableMongoidRepository < Timetable::Repository::Base
  extend Timetable::Repository::Mongoid
end
