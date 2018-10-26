class Part
  include Mongoid::Document
  extend MongoidCustomHelper

  field :name, type: String
  field :entireclass, type: String
  field :divisiontag, type: String
  field :studentcount, type: String

  belongs_to :group, foreign_key: :classid
  has_and_belongs_to_many :students

  setter_alias :studentids, :student_ids

end
