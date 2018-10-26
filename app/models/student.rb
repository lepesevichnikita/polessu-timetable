class Student
  include Mongoid::Document

  field :name, type: String
  field :number, type: String
  field :email, type: String
  field :mobile, type: String
  field :martner_id, type: String
  field :firstname, type: String
  field :lastname, type: String

  has_and_belongs_to_many :parts

end
