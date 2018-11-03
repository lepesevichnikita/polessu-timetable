class Classroom
  include Mongoid::Document
  field :name, type: String
  field :short, type: String
  field :capacity, type: String
  field :partner_id, type: String

  has_and_belongs_to_many :groups, index: true
  has_and_belongs_to_many :lessons, index: true

end
