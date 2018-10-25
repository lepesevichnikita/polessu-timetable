class Part
  include Mongoid::Document
  field :name, type: String
  field :entireclass, type: String
  field :divisiontag, type: String
  field :studentcount, type: String

  belongs_to :group
end
