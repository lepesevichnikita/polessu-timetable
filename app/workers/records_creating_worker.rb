class RecordsCreatingWorker
  include Sidekiq::Worker

  def perform(records, records_type)
    records.each do |record|
      SingleRecordCreatingWorker.perform_async(record, records_type)
    end
  end
end
