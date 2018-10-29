class TimetableLoadingWorker
  include Sidekiq::Worker

  def perform
    if TimetableCheckService::is_new_timetable?
      Timetable::drop_db
      Timetable.new
      TimetableFileInfo.first_or_create!(last_modified: TimetableCheckService::last_modified)
    end
  end
end
