class Grade
  include Mongoid::Document
  field :grade, type: String
  field :name, type: String
  field :short, type: String

  has_many :groups
end
