class SingleRecordCreatingWorker
  include Sidekiq::Worker

  def perform(record, record_type)
    records_class.send(:first_or_create!, record)
  end
end
