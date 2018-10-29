# Модель для хранения информации о файлах с расписанием
class TimetableFileInfo
  include Mongoid::Document

  field :last_modified, type: String
end