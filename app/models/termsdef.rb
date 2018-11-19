class Termsdef
  include Mongoid::Document

  field :terms, type: String
  field :name, type: String
  field :short, type: String

  has_many :lessons
  has_many :cards

  validates_uniqueness_of :terms
end
