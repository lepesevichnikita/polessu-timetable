class RecordsCreatingWorker
  include Sidekiq::Worker

  def perform(records, records_type)
    records_class = TimetableReader::REQUIRED_TYPES[records_type]
    logger.info "#{ records_type }:#{ records_class }:#{ records }\n"
    records_class.send(:first_or_create!, records)
  end
end
