class TimetableLoadingService
  include Sidekiq::Worker

  def perform
    Timetable.new
  end

end