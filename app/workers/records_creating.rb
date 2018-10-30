class RecordsCreatingWorker
  include Sidekiq::Worker

  def perform(items_of_required_type, required_type)
    Timetable::create_records items_to_hash(items_of_required_type), required_type
  end
end