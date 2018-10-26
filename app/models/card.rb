class Card
  include Mongoid::Document
  extend MongoidCustomHelper

  field :period, type: String
  field :days, type: String
  field :weeks, type: String
  field :terms, type: String

  belongs_to :lesson, foreign_key: :lessonid

  has_and_belongs_to_many :classrooms

  setter_alias :classroomids, :classroom_ids

end
