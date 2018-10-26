class RecordsCreatingWorker
  include Sidekiq::Worker

  def perform(records, records_type)
    records_class = TimetableReader::REQUIRED_TYPES[records_type]
    records_class.send(:first_or_create!, records) if !records_class.nil?
  end
end
