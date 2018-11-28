class Teacher
  include Mongoid::Document
  include Mongoid::Search

  field :name, type: String
  field :short, type: String
  field :gender, type: String
  field :color, type: String
  field :email, type: String
  field :mobile, type: String
  field :partner_id, type: String
  field :firstname, type: String
  field :lastname, type: String

  has_many :groups, foreign_key: :teacherid
  has_and_belongs_to_many :lessons, foreign_key: :teacherids

  search_in :name, :short, :firstname, :lastname
end
