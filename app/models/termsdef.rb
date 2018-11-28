class Termsdef
  include Mongoid::Document

  field :terms, type: String
  field :name, type: String
  field :short, type: String

  has_many :lessons, foreign_key: :termsdefid
  has_many :cards, foreign_key: :terms, primary_key: :terms

  validates_uniqueness_of :terms
end
