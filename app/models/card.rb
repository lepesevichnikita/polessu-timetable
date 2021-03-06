class Card
  include Mongoid::Document

  field :period, type: String
  field :days, type: String
  field :weeks, type: String
  field :terms, type: String

  field :lessonid, type: BSON::ObjectId

  belongs_to :phase, foreign_key: :period, primary_key: :period
  belongs_to :daysdef, foreign_key: :days, primary_key: :days
  belongs_to :weeksdef, foreign_key: :weeks, primary_key: :weeks
  belongs_to :termsdef, foreign_key: :terms, primary_key: :terms, optional: true

  belongs_to :lesson, foreign_key: :lessonid, index: true

  has_and_belongs_to_many :classrooms, foreign_key: :classroomids, index: true

  default_scope -> {
                  includes(
                    :phase,
                    :lesson,
                    :daysdef,
                    :weeksdef,
                    :classrooms
                  )
                }
end
