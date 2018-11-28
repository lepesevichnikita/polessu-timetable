class Daysdef
  include Mongoid::Document

  field :days, type: String
  field :name, type: String
  field :short, type: String

  has_many :lessons, foreign_key: :daysdefid
  has_many :cards, foreign_key: :days, primary_key: :days

  validates_uniqueness_of :days
  validates_uniqueness_of :short
end
