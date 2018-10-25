class Weeksdef
  include Mongoid::Document

  field :weeks, type: String
  field :name, type: String
  field :short, type: String

  has_many :lessons

end
