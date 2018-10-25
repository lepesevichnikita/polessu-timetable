class Teacher
  include Mongoid::Document

  field :name, type: String
  field :short, type: String
  field :gender, type: String
  field :color, type: String
  field :email, type: String
  field :mobile, type: String
  field :partner_id, type: String
  field :firstname, type: String
  field :lastname, type: String

  has_many :groups
  has_many :lessons
end
