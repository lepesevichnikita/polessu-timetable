class Classroom
  include Mongoid::Document
  field :name, type: String
  field :short, type: String
  field :capacity, type: String
  field :partner_id, type: String

end
