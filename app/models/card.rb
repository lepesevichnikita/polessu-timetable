class Card
  include Mongoid::Document

  field :period, type: String
  field :days, type: String
  field :weeks, type: String
  field :terms, type: String

  belongs_to :lesson, foreign_key: :lessonid, index: true

  has_and_belongs_to_many :classroom, foreign_key: :classroomids, index: true

end

