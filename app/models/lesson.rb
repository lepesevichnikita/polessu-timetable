class Lesson
  include Mongoid::Document
  extend MongoidCustomHelper

  field :periodspercard, type: String
  field :periodsperweek, type: String
  field :seminargroup, type: String
  field :capacity, type: String
  field :partner_id, type: String

  belongs_to :subject, foreign_key: :subjectid, index: true
  belongs_to :daysdef, foreign_key: :daysdefid, index: true
  belongs_to :weeksdef, foreign_key: :weeksdefid, index: true
  belongs_to :termsdef, foreign_key: :termsdefid, index: true

  has_many :cards, foreign_key: :lessonid

  has_and_belongs_to_many :groups, index: true
  has_and_belongs_to_many :parts, index: true
  has_and_belongs_to_many :teachers, index: true
  has_and_belongs_to_many :classrooms, index: true

  setter_alias :classids, :group_ids
  setter_alias :teacherids, :teacher_ids
  setter_alias :groupids, :part_ids
  setter_alias :classroomids, :classroom_ids

end
