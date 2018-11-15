# Job CheckTimetableJob
# This job checks is there a new timetable a reload an timetable
class CheckTimetableJob < ApplicationJob
  queue_as :default

  def perform
    reload_timetable if TimetableCheckService.new_timetable?
  end

  private

  def reload_timetable
    TimetableMongoidRepository.reload_timetable
    Rails.applicaion.load_tasks
    Rake::Task['mongoid_search:index'].invoke
    TimetableFileInfo.first_or_create!(
      last_modified: TimetableCheckService.last_modified
    )
  end
end
