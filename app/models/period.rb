class Period
  include Mongoid::Document

  field :name, type: String
  field :period, type: String
  field :short, type: String
  field :starttime, type: String
  field :endtime, type: String

  has_many :cards
end
