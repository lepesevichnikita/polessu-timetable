class Lesson
  include Mongoid::Document

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

  has_and_belongs_to_many :groups, foreign_key: :classids, index: true
  has_and_belongs_to_many :parts, foreign_key: :partids, index: true
  has_and_belongs_to_many :teachers, foreign_key: :teacherids, index: true
  has_and_belongs_to_many :classrooms, foreign_key: :classroomids, index: true

end
