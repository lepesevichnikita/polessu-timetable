class Card
  include Mongoid::Document

  field :period, type: String
  field :days, type: String
  field :weeks, type: String
  field :terms, type: String

  belongs_to :lesson

  has_and_belongs_to_many :classrooms

  alias :classroomids :classroom_ids
  alias :classroomids= :classroom_ids=

  def classroomids=(value)
    self.classroom_ids = value.split(',') if !value.empty?
  end

end
