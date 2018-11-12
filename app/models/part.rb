class Part
  include Mongoid::Document

  field :name, type: String
  field :entireclass, type: String
  field :divisiontag, type: String
  field :studentcount, type: String

  belongs_to :group, foreign_key: :classid, index: true
  has_and_belongs_to_many :students, foreign_key: :studentids, index: true

end

