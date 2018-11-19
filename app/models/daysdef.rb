class Daysdef
  include Mongoid::Document

  field :days, type: String
  field :name, type: String
  field :short, type: String

  has_many :lessons
  has_many :cards

  validates_uniqueness_of :days
  validates_uniqueness_of :short
end
