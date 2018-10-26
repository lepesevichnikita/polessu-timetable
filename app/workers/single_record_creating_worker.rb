class SingleRecordCreatingWorker
  include Sidekiq::Worker

  def perform(record, record_type)
    records_class = TimetableReader::REQUIRED_TYPES[record_type.to_sym]
    records_class.send(:first_or_create!, record)
  end
end
