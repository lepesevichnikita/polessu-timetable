class Period
  include Mongoid::Document

  field :name, type: String
  field :period, type: String
  field :short, type: String
  field :starttime, type: String
  field :endtime, type: String

  has_many :cards, foreign_key: :period, primary_key: :period

  validates_uniqueness_of :period
  validates_uniqueness_of :short
end
