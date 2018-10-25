class Group
  include Mongoid::Document
  field :name, type: String
  field :short, type: String
  field :partner_id, type: String
  field :grade, type: String

  belongs_to :teacher
  has_and_belongs_to_many :classrooms
  has_many :parts

  alias :classroomids :classroom_ids
  alias :classroomids= :classroom_ids=

  def classroomids=(value)
    self.classroom_ids = value.split(',') if !value.empty?
  end
end
