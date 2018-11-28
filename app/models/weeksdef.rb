class Weeksdef
  include Mongoid::Document

  field :weeks, type: String
  field :name, type: String
  field :short, type: String

  has_many :lessons, foreign_key: :weeksdefid
  has_many :cards, foreign_key: :weeks, primary_key: :weeks

  validates_uniqueness_of :weeks
  validates_uniqueness_of :short
end
