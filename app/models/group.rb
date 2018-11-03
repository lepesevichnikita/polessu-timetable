class Group
  include Mongoid::Document
  extend MongoidCustomHelper

  field :name, type: String
  field :short, type: String
  field :partner_id, type: String
  field :grade, type: String

  belongs_to :teacher, foreign_key: :teacherid, optional: true, index: true
  has_and_belongs_to_many :classrooms
  has_many :parts, foreign_key: :classid

  setter_alias :classroomids, :classroom_ids

end
