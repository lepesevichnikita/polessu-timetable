class Weeksdef
  include Mongoid::Document

  field :weeks, type: String
  field :name, type: String
  field :short, type: String

  has_many :lessons
  has_many :cards

  validates_uniqueness_of :weeks
  validates_uniqueness_of :short
end
