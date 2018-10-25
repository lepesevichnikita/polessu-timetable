class Subject
  include Mongoid::Document

  field :name, type: String
  field :short, type: String
  field :partner_id, type: String

  has_many :lessons
end
