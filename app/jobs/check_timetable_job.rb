class CheckTimetableJob < ApplicationJob
  queue_as :default

  def perform
    if TimetableCheckService::is_new_timetable?
      reload_timetable
    end
  end

  def reload_timetable
    Timetable::drop_db
    Timetable.new
    TimetableFileInfo.first_or_create!(last_modified: TimetableCheckService::last_modified)
  end
end