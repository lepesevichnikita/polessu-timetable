class Lesson
  include Mongoid::Document

  field :periodspercard, type: String
  field :periodsperweek, type: String
  field :seminargroup, type: String
  field :capacity, type: String
  field :partner_id, type: String

  belongs_to :subject
  belongs_to :daysdef
  belongs_to :weeksdef
  belongs_to :termsdef

  has_many :cards

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :classrooms

  alias :groupids :group_ids
  alias :groupids= :group_ids=

  def groupids=(value)
    self.group_ids = value.split(',') if !value.empty?
  end

  alias :teacherids :teacher_ids
  alias :teacherids= :teacher_ids=

  def teacherids=(value)
    self.teacher_ids = value.split(',') if !value.empty?
  end

  alias :classroomids :classroom_ids
  alias :classroomids= :classroom_ids=

  def classroomids=(value)
    self.classroom_ids = value.split(',') if !value.empty?
  end


end
