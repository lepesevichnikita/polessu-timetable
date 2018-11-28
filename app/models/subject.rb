class Subject
  include Mongoid::Document
  include Mongoid::Search

  field :name, type: String
  field :short, type: String
  field :partner_id, type: String

  has_many :lessons, foreign_key: :subjectid

  search_in :name, :short
end
