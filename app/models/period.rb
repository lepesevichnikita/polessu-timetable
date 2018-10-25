class Period
  include Mongoid::Document

  field :period, type: String
  field :short, type: String
  field :starttime, type: String
  field :endtime, type: String
end
